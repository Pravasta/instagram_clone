import 'package:bloc/bloc.dart';
import 'package:instagram_clone/features/camera/model/upload_response_model.dart';
import 'package:instagram_clone/features/camera/repository/upload_repository.dart';
import 'package:instagram_clone/utils/preferences/preferences.dart';
import 'package:meta/meta.dart';

part 'upload_story_event.dart';
part 'upload_story_state.dart';

class UploadStoryBloc extends Bloc<UploadStoryEvent, UploadStoryState> {
  final UploadRepository _repository;
  final PreferencesHelper _helper;

  UploadStoryBloc(
    this._repository,
    this._helper,
  ) : super(UploadStoryState()) {
    on<UploadStoryEvent>((event, emit) {});
    on<OnUploadStory>((event, emit) async {
      emit(state.copyWith(status: UploadStoryStatusState.loading));
      print('laoding');
      try {
        final token = await _helper.getPref('isToken');
        final data = await _repository.postStory(
          token,
          event.bytes,
          event.description ?? '',
          event.fileName,
          event.lat,
          event.lon,
        );
        emit(state.copyWith(
          status: UploadStoryStatusState.success,
          uploadResponse: data,
          message: data.message,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: UploadStoryStatusState.failed,
          message: e.toString(),
        ));
      }
    });
  }
}
