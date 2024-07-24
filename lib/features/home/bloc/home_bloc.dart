import 'package:bloc/bloc.dart';
import 'package:instagram_clone/constant/app_state.dart';
import 'package:instagram_clone/features/home/model/story_model.dart';
import 'package:instagram_clone/features/home/repository/home_repository.dart';
import 'package:instagram_clone/utils/preferences/preferences.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;
  final PreferencesHelper _helper;

  HomeBloc(this._repository, this._helper) : super(HomeState()) {
    on<HomeEvent>((event, emit) {});
    on<OnGetAllStoryEvent>(_onGetAllStory);
    on<OnRefreshStoryEvent>(_onRefresh);
  }

  void _onGetAllStory(
    OnGetAllStoryEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (state.pages == 1) {
      emit(state.copyWith(status: HomeStatusState.loading));
    }
    try {
      final token = await _helper.getPref('isToken');
      final story = await _repository.getAllStory(
        token,
        state.pages,
        state.size,
        1,
      );
      if (story == null || story.isEmpty) {
        emit(state.copyWith(
          status: HomeStatusState.noData,
          message: 'No Data',
          story: [],
        ));
      } else if (story.isNotEmpty) {
        final newStories = List<ListStory>.from(state.story)..addAll(story);
        print(newStories.length);
        if (story.length < state.size) {
          emit(state.copyWith(
            status: HomeStatusState.success,
            story: newStories,
            pages: state.pages,
          ));
        } else {
          emit(state.copyWith(
            status: HomeStatusState.success,
            story: newStories,
            pages: state.pages! + 1,
          ));
        }
      }
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatusState.error,
        message: e.toString(),
      ));
    }
  }

  void _onRefresh(
    OnRefreshStoryEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatusState.loading));

    final token = await _helper.getPref('isToken');
    final story = await _repository.getAllStory(
      token,
      1,
      state.size,
      1,
    );
    if (story == null || story.isEmpty) {
      emit(state.copyWith(
        status: HomeStatusState.noData,
        message: 'No Data',
        story: [],
      ));
    } else if (story.isNotEmpty) {
      emit(state.copyWith(
        status: HomeStatusState.success,
        story: story,
        pages: state.pages,
      ));
    }
  }
}
