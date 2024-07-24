part of 'detail_story_bloc.dart';

class DetailStoryState {
  final String message;
  final Story? story;
  final DetailStoryStatusState status;

  DetailStoryState({
    this.message = '',
    this.story,
    this.status = DetailStoryStatusState.initial,
  });

  DetailStoryState copyWith({
    String? message,
    Story? story,
    DetailStoryStatusState? status,
  }) {
    return DetailStoryState(
      message: message ?? this.message,
      story: story ?? this.story,
      status: status ?? this.status,
    );
  }
}
