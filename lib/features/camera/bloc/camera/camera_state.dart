part of 'camera_bloc.dart';

enum CameraStatusState { initial, loading, success, error }

class CameraState {
  final String message;
  final String? imagePath;
  final XFile? imageFile;
  final CameraStatusState status;

  CameraState({
    this.message = '',
    this.imagePath,
    this.imageFile,
    this.status = CameraStatusState.initial,
  });

  CameraState copyWith({
    String? message,
    String? imagePath,
    XFile? imageFile,
    CameraStatusState? status,
  }) {
    return CameraState(
      message: message ?? this.message,
      imagePath: imagePath ?? this.imagePath,
      imageFile: imageFile ?? this.imageFile,
      status: status ?? this.status,
    );
  }
}
