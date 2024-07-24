part of 'maps_cubit.dart';

enum MapStatusState { initial, loading, success, error }

class MapsState {
  final GoogleMapController? controller;
  final Set<Marker> markers;
  final MapStatusState status;
  final String message;
  final geo.Placemark? placemark;
  final LatLng? latLng;

  MapsState({
    this.controller,
    this.markers = const {},
    this.status = MapStatusState.initial,
    this.message = '',
    this.placemark,
    this.latLng,
  });

  MapsState copyWith({
    GoogleMapController? controller,
    Set<Marker>? markers,
    MapStatusState? status,
    String? message,
    geo.Placemark? placemark,
    LatLng? latLng,
  }) {
    return MapsState(
      controller: controller ?? this.controller,
      markers: markers ?? this.markers,
      status: status ?? this.status,
      message: message ?? this.message,
      placemark: placemark ?? this.placemark,
      latLng: latLng ?? this.latLng,
    );
  }
}
