import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:instagram_clone/features/camera/repository/camera_repository.dart';
import 'package:meta/meta.dart';

part 'init_camera_event.dart';
part 'init_camera_state.dart';

class InitCameraBloc extends Bloc<InitCameraEvent, InitCameraState> {
  final CameraRepository _cameraRepository;

  InitCameraBloc(this._cameraRepository) : super(InitCameraState()) {
    on<InitCameraEvent>((event, emit) {});
    on<OnCameraIntialized>((event, emit) async {
      emit(state.copyWith(status: InitCameraStatusState.loading));
      try {
        await _cameraRepository.initializedCamera(event.cameraDescription);
        emit(state.copyWith(
          status: InitCameraStatusState.success,
          controller: _cameraRepository.controller,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: InitCameraStatusState.error,
          message: e.toString(),
        ));
      }
    });
    on<OnDisposeCamera>((event, emit) {
      _cameraRepository.dispose();
      emit(state.copyWith(status: InitCameraStatusState.initial));
    });
    on<OnSwitchCamera>((event, emit) async {
      emit(state.copyWith(status: InitCameraStatusState.loading));
      try {
        final currentCamera = _cameraRepository.controller!.description;
        final cameras = await availableCameras();
        final newCamera =
            cameras.firstWhere((element) => element != currentCamera);
        await _cameraRepository.initializedCamera(newCamera);
        emit(state.copyWith(
          status: InitCameraStatusState.success,
          controller: _cameraRepository.controller,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: InitCameraStatusState.error,
          message: e.toString(),
        ));
      }
    });
  }
}
