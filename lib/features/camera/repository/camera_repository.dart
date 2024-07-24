import 'package:camera/camera.dart';
import 'package:instagram_clone/exception/api_exception.dart';
import 'package:instagram_clone/utils/camera/camera_utils.dart';

abstract class CameraRepository {
  Future<XFile?> onGalleryView();
  Future<void> initializedCamera(CameraDescription cameraDescription);
  void dispose();
  CameraController? get controller;
}

class CameraRepositoryImpl implements CameraRepository {
  final CameraUtils _cameraUtils;

  CameraRepositoryImpl({required CameraUtils cameraUtils})
      : _cameraUtils = cameraUtils;

  @override
  Future<XFile?> onGalleryView() async {
    try {
      final camera = await _cameraUtils.onGalleryView();
      return camera;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void dispose() {
    _cameraUtils.dispose();
  }

  @override
  Future<void> initializedCamera(CameraDescription cameraDescription) async {
    try {
      final camera = _cameraUtils.initializedCamera(cameraDescription);
      return camera;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  CameraController? get controller => _cameraUtils.controller;
}
