import 'package:bloc/bloc.dart';
import 'package:instagram_clone/constant/app_state.dart';
import 'package:instagram_clone/exception/api_exception.dart';
import 'package:instagram_clone/features/detail_story/model/detail_story_model.dart';
import 'package:instagram_clone/features/detail_story/repository/detail_story_repository.dart';
import 'package:instagram_clone/utils/preferences/preferences.dart';
import 'package:meta/meta.dart';

part 'detail_story_event.dart';
part 'detail_story_state.dart';

class DetailStoryBloc extends Bloc<DetailStoryEvent, DetailStoryState> {
  final DetailStoryRepository _repository;
  final PreferencesHelper _helper;

  DetailStoryBloc(this._repository, this._helper) : super(DetailStoryState()) {
    on<DetailStoryEvent>((event, emit) {});
    on<OnGetDetailStory>((event, emit) async {
      emit(state.copyWith(status: DetailStoryStatusState.loading));
      try {
        final token = await _helper.getPref('isToken');
        final data = await _repository.getDetailStory(event.id, token);
        emit(state.copyWith(
          status: DetailStoryStatusState.succes,
          story: data,
        ));
      } on ApiException catch (e) {
        emit(state.copyWith(
          message: e.message,
          status: DetailStoryStatusState.error,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: DetailStoryStatusState.error,
          message: e.toString(),
        ));
      }
    });
  }
}
