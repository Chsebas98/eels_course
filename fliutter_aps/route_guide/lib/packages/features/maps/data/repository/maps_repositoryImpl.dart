import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dio/dio.dart';
import 'maps_repository.dart';

class MapsRepositoryImpl extends MapsRepository {
  final Dio dio;
  final String apiKey; // esta apiKey podría ser para ORS o usar tu propia clave

  MapsRepositoryImpl({required this.dio, required this.apiKey});

  @override
  Future<List<LatLng>> getRouteBetweenPoints({
    required LatLng origin,
    required LatLng destination,
  }) async {
    try {
      final response = await dio.get(
        'https://api.openrouteservice.org/v2/directions/driving-car',
        queryParameters: {
          'start': '${origin.longitude},${origin.latitude}',
          'end': '${destination.longitude},${destination.latitude}',
        },
        options: Options(
          headers: {
            'Authorization':
                'eyJvcmciOiI1YjNjZTM1OTc4NTExMTAwMDFjZjYyNDgiLCJpZCI6ImRkNWVlZTQ0ZmNmZTRjMzk5NWIwNzY2YTVjZDA4NDdmIiwiaCI6Im11cm11cjY0In0=', // tu clave de OpenRouteService
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final features = data['features'] as List<dynamic>?;
        if (features != null && features.isNotEmpty) {
          final geometry = features[0]['geometry'];
          if (geometry != null && geometry['coordinates'] != null) {
            final coords = geometry['coordinates'] as List<dynamic>;
            List<LatLng> points = coords.map((c) {
              // OpenRouteService devuelve [lng, lat]
              return LatLng((c[1] as num).toDouble(), (c[0] as num).toDouble());
            }).toList();
            return points;
          }
        }
      } else {
        throw Exception(
          'Error en ORS API: ${response.statusCode} ${response.data}',
        );
      }
    } catch (e) {
      debugPrint("Error al obtener rutas en repository: $e");
      rethrow;
    }

    // Si nada devuelve antes, retornas lista vacía
    return <LatLng>[];
  }
}
