part of 'localization_bloc.dart';

@immutable
sealed class LocalizationEvent {}

class ChangeLocalization extends LocalizationEvent {
  final Locale locale;

  ChangeLocalization({required this.locale});
}

class LoadLocalization extends LocalizationEvent {}
