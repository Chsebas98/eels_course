import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapsRepository {
  Future<List<LatLng>> getRouteBetweenPoints({
    required LatLng origin,
    required LatLng destination,
  });
}
