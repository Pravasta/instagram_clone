part of 'detail_story_bloc.dart';

@immutable
sealed class DetailStoryEvent {}

class OnGetDetailStory extends DetailStoryEvent {
  final String id;

  OnGetDetailStory({required this.id});
}
