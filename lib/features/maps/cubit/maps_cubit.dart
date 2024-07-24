import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:instagram_clone/features/maps/repository/map_repository.dart';
import 'package:meta/meta.dart';
import 'package:geocoding/geocoding.dart' as geo;

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  MapsCubit(this._repository) : super(MapsState());

  final MapRepository _repository;

  void setController(GoogleMapController mapController) {
    _repository.setMapController(mapController);
    emit(state.copyWith(controller: mapController));
  }

  Future<void> loadMarkers(double lat, double lon) async {
    emit(state.copyWith(status: MapStatusState.loading));
    await Future.delayed(const Duration(seconds: 2));
    try {
      final markers = await _repository.getMarkers(lat, lon);
      final placemark = await _repository.getInfoLocation(lat, lon);
      emit(state.copyWith(
        status: MapStatusState.success,
        markers: markers,
        placemark: placemark,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MapStatusState.error,
        message: e.toString(),
      ));
    }
  }

  void zoomInMaps() => _repository.zoomInMaps();
  void zoomOutMaps() => _repository.zoomOutMaps();

  Future<void> getCurrentLocation() async {
    emit(state.copyWith(status: MapStatusState.loading));
    try {
      final latLng = await _repository.getCurrentLocation();
      final marker =
          await _repository.getMarkers(latLng.latitude, latLng.longitude);
      final placemark =
          await _repository.getInfoLocation(latLng.latitude, latLng.longitude);
      emit(state.copyWith(
        status: MapStatusState.success,
        latLng: latLng,
        markers: marker,
        placemark: placemark,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MapStatusState.error,
        message: e.toString(),
      ));
    }
  }

  Future<void> setLocation(LatLng latLng) async {
    try {
      emit(state.copyWith(markers: {}));
      final data = await _repository.defineMarker(latLng);
      final placemark =
          await _repository.getInfoLocation(latLng.latitude, latLng.longitude);
      emit(state.copyWith(
        markers: data,
        placemark: placemark,
        status: MapStatusState.success,
        latLng: latLng,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MapStatusState.error,
        message: e.toString(),
      ));
    }
  }
}
