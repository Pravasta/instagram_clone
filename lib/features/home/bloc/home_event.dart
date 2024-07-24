part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class OnGetAllStoryEvent extends HomeEvent {}

class OnRefreshStoryEvent extends HomeEvent {}
