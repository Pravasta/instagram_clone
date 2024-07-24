part of 'localization_bloc.dart';

enum LocalizationStatusState { initial, success, error }

class LocalizationState {
  final Locale locale;
  final LocalizationStatusState status;

  LocalizationState({
    this.locale = const Locale('en'),
    this.status = LocalizationStatusState.initial,
  });

  LocalizationState copyWith({
    Locale? locale,
    LocalizationStatusState? status,
  }) {
    return LocalizationState(
      locale: locale ?? this.locale,
      status: status ?? this.status,
    );
  }
}
