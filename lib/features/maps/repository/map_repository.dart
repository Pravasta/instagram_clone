import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:instagram_clone/exception/api_exception.dart';
import 'package:instagram_clone/utils/maps/maps_utils.dart';
import 'package:geocoding/geocoding.dart' as geo;

abstract class MapRepository {
  Future<Set<Marker>> getMarkers(double lat, double lon);
  void zoomInMaps();
  void zoomOutMaps();
  void setMapController(GoogleMapController controller);
  Future<geo.Placemark> getInfoLocation(double lat, double lon);
  Future<LatLng> getCurrentLocation();
  Future<Set<Marker>> defineMarker(LatLng latLng);
}

class MapRepositoryImpl implements MapRepository {
  final MapsUtils _service;

  MapRepositoryImpl({required MapsUtils service}) : _service = service;

  @override
  Future<Set<Marker>> getMarkers(double lat, double lon) async {
    final markers = await _service.getMarkers(lat, lon);
    return markers;
  }

  @override
  void zoomInMaps() => _service.zoomInMaps();

  @override
  void zoomOutMaps() => _service.zoomOutMaps();

  @override
  void setMapController(GoogleMapController controller) {
    _service.setMapController(controller);
  }

  @override
  Future<geo.Placemark> getInfoLocation(double lat, double lon) async {
    final call = await _service.getInfoLocation(lat, lon);
    return call[0];
  }

  @override
  Future<LatLng> getCurrentLocation() async {
    try {
      final latLng = await _service.getCurrentLocation();
      return latLng;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<Set<Marker>> defineMarker(LatLng latLng) async {
    try {
      final data = await _service.defineMarker(latLng);
      return data;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  factory MapRepositoryImpl.create() {
    return MapRepositoryImpl(service: MapsUtils());
  }
}
