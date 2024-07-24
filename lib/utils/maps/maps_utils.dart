import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:instagram_clone/exception/api_exception.dart';
import 'package:location/location.dart';

class MapsUtils {
  static late GoogleMapController _mapController;
  static GoogleMapController get mapController => _mapController;

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  Future<Set<Marker>> getMarkers(
    double lat,
    double lon,
  ) async {
    final marker = Marker(
      markerId: const MarkerId('source'),
      position: LatLng(lat, lon),
      onTap: () {
        _mapController.animateCamera(
          CameraUpdate.newLatLngZoom(
            LatLng(lat, lon),
            18,
          ),
        );
      },
    );

    return {marker};
  }

  void zoomInMaps() => mapController.animateCamera(CameraUpdate.zoomIn());
  void zoomOutMaps() => mapController.animateCamera(CameraUpdate.zoomOut());

  Future<List<geo.Placemark>> getInfoLocation(double lat, double lon) async {
    try {
      final info = await geo.placemarkFromCoordinates(lat, lon);
      return info;
    } catch (e) {
      throw ApiException();
    }
  }

  Future<Set<Marker>> defineMarker(LatLng latLng) async {
    final marker = Marker(
      markerId: const MarkerId('source'),
      position: latLng,
    );

    return {marker};
  }

  Future<LatLng> getCurrentLocation() async {
    final location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGrandted;
    LocationData locationData;

    try {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          throw ApiException(message: 'Location services is not available');
        }
      }

      permissionGrandted = await location.hasPermission();
      if (permissionGrandted == PermissionStatus.denied) {
        permissionGrandted = await location.requestPermission();
        if (permissionGrandted != PermissionStatus.granted) {
          throw ApiException(message: 'Location permission is denied');
        }
      }

      locationData = await location.getLocation();
      final latLng = LatLng(locationData.latitude!, locationData.longitude!);

      return latLng;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
