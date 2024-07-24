import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/exception/api_exception.dart';

class CameraUtils {
  final ImagePicker _picker;
  CameraController? _controller;

  CameraController? get controller => _controller;

  CameraUtils({required ImagePicker picker}) : _picker = picker;

  Future<XFile?> onGalleryView() async {
    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux) {
      return null;
    }

    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    return pickedFile;
  }

  Future<void> initializedCamera(CameraDescription cameraDescription) async {
    final previousCamera = _controller;
    final cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
    );

    await previousCamera?.dispose();
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      throw ApiException(message: 'Error initializing camera :$e');
    } catch (e) {
      throw ApiException(message: 'Eror : $e');
    }

    _controller = cameraController;
  }

  void dispose() {
    _controller?.dispose();
  }
}
