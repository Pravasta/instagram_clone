import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/features/camera/repository/camera_repository.dart';
import 'package:meta/meta.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final CameraRepository _repository;

  CameraBloc(this._repository) : super(CameraState()) {
    on<CameraEvent>((event, emit) {});
    on<OnGalleryViewEvent>((event, emit) async {
      emit(state.copyWith(status: CameraStatusState.loading));
      try {
        final XFile? call = await _repository.onGalleryView();
        if (call != null) {
          emit(state.copyWith(
            status: CameraStatusState.success,
            imageFile: call,
            imagePath: call.path,
          ));
        }
      } catch (e) {
        emit(state.copyWith(
          status: CameraStatusState.error,
          message: e.toString(),
        ));
      }
    });
    on<OnButtonCameraClickEvent>((event, emit) async {
      emit(state.copyWith(status: CameraStatusState.loading));
      try {
        if (_repository.controller != null &&
            _repository.controller!.value.isInitialized) {
          final call = await _repository.controller!.takePicture();

          emit(state.copyWith(
            status: CameraStatusState.success,
            imageFile: call,
            imagePath: call.path,
          ));
        }
      } catch (e) {
        emit(state.copyWith(
          status: CameraStatusState.error,
          message: e.toString(),
        ));
      }
    });
  }
}
