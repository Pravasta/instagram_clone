part of 'init_camera_bloc.dart';

enum InitCameraStatusState { initial, loading, success, error }

class InitCameraState {
  final String message;
  final CameraController? controller;
  final InitCameraStatusState status;

  InitCameraState({
    this.message = '',
    this.controller,
    this.status = InitCameraStatusState.initial,
  });

  InitCameraState copyWith({
    String? message,
    CameraController? controller,
    InitCameraStatusState? status,
  }) {
    return InitCameraState(
      message: message ?? this.message,
      controller: controller ?? this.controller,
      status: status ?? this.status,
    );
  }
}
