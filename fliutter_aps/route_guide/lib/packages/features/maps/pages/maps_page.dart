import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:route_guide/core/app/di/injection_repositories.dart';
import 'package:route_guide/packages/features/maps/bloc/map/maps_bloc.dart';
import 'package:route_guide/packages/features/maps/widgets/top_stats_bar.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<MapsBloc>(),
      child: const _MapsPageView(),
    );
  }
}

class _MapsPageView extends StatefulWidget {
  const _MapsPageView();

  @override
  State<_MapsPageView> createState() => _MapsPageViewState();
}

class _MapsPageViewState extends State<_MapsPageView> {
  LatLng? _origin;
  LatLng? _destination;
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _retrieveCurrentLocation();
  }

  Future<void> _retrieveCurrentLocation() async {
    try {
      // Aquí ya permisos otorgados, usar nueva manera:
      LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 0, // cada cuánto debería actualizarse (en metros)
      );

      Position pos = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      final latLng = LatLng(pos.latitude, pos.longitude);
      setState(() {
        _origin = latLng;
      });

      if (_mapController != null) {
        _mapController!.animateCamera(CameraUpdate.newLatLng(latLng));
      }
    } catch (e) {
      debugPrint("Error al obtener ubicación: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<MapsBloc, MapsState>(
        listener: (context, state) {
          if (state.polylines.isNotEmpty && _destination != null) {
            // Puedes centrar la cámara sobre la ruta completa
            // (más avanzado: usar LatLngBounds)
            _mapController?.animateCamera(
              CameraUpdate.newLatLng(_destination!),
            );
          }
        },
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _origin ?? LatLng(-0.51273, -78.57066),
                zoom: 15,
              ),
              zoomControlsEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              polylines: context.select(
                (MapsBloc bloc) => bloc.state.showMyRoute
                    ? bloc.state.polylines.values.toSet()
                    : <Polyline>{},
              ),
              markers: _buildMarkers(),
              onMapCreated: (controller) {
                _mapController = controller;
                context.read<MapsBloc>().add(MapInitializedEvent(controller));
                // Si ya tienes origen, centrar ahí
                if (_origin != null) {
                  controller.animateCamera(CameraUpdate.newLatLng(_origin!));
                }
              },
              onTap: (latlng) {
                // debugPrint("Tap en: $latlng");
                if (_origin == null) {
                  // Si por alguna razón aún no tienes origen, ignora el tap
                  return;
                }
                setState(() {
                  _destination = latlng;
                });
                debugPrint("Destino ahora vale: $_destination");
                context.read<MapsBloc>().add(
                  RequestRouteEvent(
                    origin: _origin!,
                    destination: _destination!,
                  ),
                );
              },
            ),
            BlocBuilder<MapsBloc, MapsState>(
              builder: (context, state) {
                return Positioned(
                  top: MediaQuery.of(context).padding.top + 8.h,
                  left: 16.w,
                  right: 16.w,
                  child: TopStatsBar(
                    distance: state.distance,
                    kcal: state.calories,
                    velocity: state.duration,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Set<Marker> _buildMarkers() {
    final m = <Marker>{};
    if (_origin != null) {
      m.add(
        Marker(
          markerId: const MarkerId('origin'),
          position: _origin!,
          infoWindow: const InfoWindow(title: 'Origen'),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        ),
      );
    }
    if (_destination != null) {
      m.add(
        Marker(
          markerId: const MarkerId('destination'),
          position: _destination!,
          infoWindow: const InfoWindow(title: 'Destino'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    }
    // también podrías agregar markers del estado del Bloc si los usas
    m.addAll(
      context.select((MapsBloc bloc) => bloc.state.markers.values.toSet()),
    );
    return m;
  }
}
