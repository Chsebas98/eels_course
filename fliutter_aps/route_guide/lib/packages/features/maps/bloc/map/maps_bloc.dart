import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:route_guide/core/core.dart';
import 'package:route_guide/packages/data/account/domain/user/auth_repository.dart';
import 'package:route_guide/packages/features/maps/data/repository/maps_repository.dart';
import 'package:route_guide/shared/shared.dart';

part 'maps_event.dart';
part 'maps_state.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  final MapsRepository mapsRepository;
  final AuthRepository authRepository;
  MapsBloc(this.mapsRepository, this.authRepository) : super(MapsState()) {
    on<MapInitializedEvent>(_onMapInitializedEvent);
    on<FollowingUserEvent>(_onFollowingUserEvent);
    on<UpdateUserPolylineEvent>(_onUpdateUserPolylineEvent);
    on<ChangeShowUserRouteEvent>(_onChangeShowUserRouteEvent);
    on<AddPolylineEvent>(_onAddPolylineEvent);
    on<RequestRouteEvent>(_onRequestRouteEvent);
  }

  FutureOr<void> _onMapInitializedEvent(
    MapInitializedEvent event,
    Emitter<MapsState> emit,
  ) {
    emit(
      state.copyWith(isMapInitialized: true, mapController: event.controller),
    );
  }

  FutureOr<void> _onFollowingUserEvent(
    FollowingUserEvent event,
    Emitter<MapsState> emit,
  ) {
    // Solo centrar si ya se inicializó el mapa
    if (state.isMapInitialized && state.mapController != null) {
      // Puedes optar por centrar en la última ubicación registrada como marcador, por ejemplo
      // Aquí no tengo la ubicación directamente en el evento, solo el flag
    }
    emit(state.copyWith(isFollowingUser: event.isFollowigUser));
  }

  FutureOr<void> _onUpdateUserPolylineEvent(
    UpdateUserPolylineEvent event,
    Emitter<MapsState> emit,
  ) async {
    // event.userLocations ya es List<LatLng>, así que simplemente reasignas o actualizas
    // Supongamos que la ruta del usuario tiene una clave fija, por ejemplo 'user_route'
    final String routeId = 'user_route';
    final poly = Polyline(
      polylineId: PolylineId(routeId),
      color: AppColors.primary,
      width: 4,
      points: event.userLocations,
    );
    final newPolys = Map<String, Polyline>.from(state.polylines);
    newPolys[routeId] = poly;

    // 1) calcular distancia
    double distanciaKm = Helpers.totalDistance(event.userLocations);

    // 2) calcular velocidad promedio
    double velocidadKmh = 0.0;
    if (event.timestamps.length >= 2) {
      velocidadKmh = Helpers.averageSpeed(
        event.userLocations,
        event.timestamps,
      );
    }

    // 3) estimar calorías
    final userModel = await authRepository.currentUser.first;

    debugPrint(userModel.toString());

    const double pesoKg = 70.0; // ejemplo
    double horas = 0.0;
    if (event.timestamps.length >= 2) {
      final durationSec = event.timestamps.last
          .difference(event.timestamps.first)
          .inSeconds;
      horas = durationSec / 3600.0;
    }
    double calorias = Helpers.estimateCalories(
      speedKmh: velocidadKmh,
      durationHours: horas,
      weightKg: pesoKg,
    );
    debugPrint('distance $distanciaKm speed $velocidadKmh calories $calorias');
    emit(
      state.copyWith(
        polylines: newPolys,
        distance: distanciaKm.toString(),
        speed: velocidadKmh.toString(),
        calories: calorias.toString(),
      ),
    );
  }

  FutureOr<void> _onChangeShowUserRouteEvent(
    ChangeShowUserRouteEvent event,
    Emitter<MapsState> emit,
  ) {
    emit(state.copyWith(showMyRoute: !state.showMyRoute));
  }

  FutureOr<void> _onAddPolylineEvent(
    AddPolylineEvent event,
    Emitter<MapsState> emit,
  ) {
    // Directamente recibir polylines y markers desde evento
    emit(state.copyWith(polylines: event.polylines, markers: event.markers));
  }

  FutureOr<void> _onRequestRouteEvent(
    RequestRouteEvent event,
    Emitter<MapsState> emit,
  ) async {
    try {
      final points = await mapsRepository.getRouteBetweenPoints(
        origin: event.origin,
        destination: event.destination,
      );
      final poly = Polyline(
        polylineId: PolylineId('route_1'),
        color: AppColors.blue,
        width: 4,
        points: points,
      );
      // debugPrint(poly.points.toString());
      final newPolys = Map<String, Polyline>.from(state.polylines);
      newPolys['route_1'] = poly;

      final userModel = await authRepository.currentUser.first;

      debugPrint(userModel.toString());
      // 1) calcular distancia
      double distanciaKm = Helpers.totalDistance([
        event.origin,
        event.destination,
      ]);

      // 3) estimar calorías
      debugPrint(userModel.toString());
      final speedAsume = Helpers.assumeSpeedKmh(
        distanceKm: distanciaKm,
        weightKg: userModel!.weight.toDouble(),
      );

      final asumeDuration = Helpers.assumeDurationHours(
        distanceKm: distanciaKm,
        speedKmh: speedAsume,
      );
      double calorias = Helpers.estimateCalories(
        speedKmh: speedAsume,
        durationHours: asumeDuration / 60,
        weightKg: userModel.weight,
      );

      emit(
        state.copyWith(
          polylines: newPolys,
          showMyRoute: true,
          distance: distanciaKm.toString(),
          calories: calorias.toString(),
          duration: asumeDuration.toString(),
        ),
      );
    } catch (e) {
      debugPrint("Error al obtener ruta: $e");
    }
  }
}
