part of 'camera_bloc.dart';

@immutable
sealed class CameraEvent {}

class OnGalleryViewEvent extends CameraEvent {}

class OnButtonCameraClickEvent extends CameraEvent {}
