part of 'home_bloc.dart';

class HomeState {
  final String message;
  final HomeStatusState status;
  final int? pages;
  final int size;
  final List<ListStory> story;

  HomeState({
    this.message = '',
    this.pages = 1,
    this.size = 10,
    this.status = HomeStatusState.initial,
    this.story = const [],
  });

  HomeState copyWith({
    String? message,
    HomeStatusState? status,
    List<ListStory>? story,
    int? pages,
    int? size,
  }) {
    return HomeState(
      message: message ?? this.message,
      status: status ?? this.status,
      story: story ?? this.story,
      pages: pages ?? this.pages,
      size: size ?? this.size,
    );
  }
}
