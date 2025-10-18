part of 'maps_bloc.dart';

final class MapsState extends Equatable {
  const MapsState({
    this.mapController,
    this.isMapInitialized = false,
    this.isFollowingUser = true,
    this.showMyRoute = true,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers,
    this.distance = '0',
    this.calories = '0',
    this.speed = '0',
    this.duration = '0',
  }) : polylines = polylines ?? const {},
       markers = markers ?? const {};

  final bool isMapInitialized;
  final bool isFollowingUser;
  final bool showMyRoute;
  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;
  final GoogleMapController? mapController;
  final String distance;
  final String calories;
  final String speed;
  final String duration;

  MapsState copyWith({
    bool? isMapInitialized,
    bool? isFollowingUser,
    bool? showMyRoute,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers,
    GoogleMapController? mapController,
    String? distance,
    String? calories,
    String? speed,
    String? duration,
  }) => MapsState(
    isMapInitialized: isMapInitialized ?? this.isMapInitialized,
    isFollowingUser: isFollowingUser ?? this.isFollowingUser,
    polylines: polylines ?? this.polylines,
    showMyRoute: showMyRoute ?? this.showMyRoute,
    markers: markers ?? this.markers,
    mapController: mapController ?? this.mapController,
    distance: distance ?? this.distance,
    calories: calories ?? this.calories,
    speed: speed ?? this.speed,
    duration: duration ?? this.duration,
  );

  @override
  List<Object?> get props => [
    isMapInitialized,
    isFollowingUser,
    polylines,
    showMyRoute,
    markers,
    mapController,
    distance,
    calories,
    speed,
    duration,
  ];
}
