part of 'maps_bloc.dart';

sealed class MapsEvent extends Equatable {
  const MapsEvent();

  @override
  List<Object> get props => [];
}

class MapInitializedEvent extends MapsEvent {
  final GoogleMapController controller;

  const MapInitializedEvent(this.controller);
}

class FollowingUserEvent extends MapsEvent {
  const FollowingUserEvent(this.isFollowigUser);

  final bool isFollowigUser;
}

class UpdateUserPolylineEvent extends MapsEvent {
  const UpdateUserPolylineEvent({
    required this.userLocations,
    required this.timestamps,
  });

  final List<LatLng> userLocations;
  final List<DateTime> timestamps;
}

class ChangeShowUserRouteEvent extends MapsEvent {
  const ChangeShowUserRouteEvent();
}

class AddPolylineEvent extends MapsEvent {
  const AddPolylineEvent(this.polylines, this.markers);

  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;
}

class RequestRouteEvent extends MapsEvent {
  final LatLng origin;
  final LatLng destination;
  const RequestRouteEvent({required this.origin, required this.destination});
}
