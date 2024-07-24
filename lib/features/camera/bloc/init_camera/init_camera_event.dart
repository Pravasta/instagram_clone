part of 'init_camera_bloc.dart';

@immutable
sealed class InitCameraEvent {}

class OnCameraIntialized extends InitCameraEvent {
  final CameraDescription cameraDescription;

  OnCameraIntialized({required this.cameraDescription});
}

class OnDisposeCamera extends InitCameraEvent {}

class OnSwitchCamera extends InitCameraEvent {}
