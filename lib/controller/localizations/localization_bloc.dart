import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationState()) {
    on<LocalizationEvent>((event, emit) {});
    on<ChangeLocalization>(_changeLocalization);
    on<LoadLocalization>(_loadLocalization);
  }

  void _changeLocalization(
    ChangeLocalization event,
    Emitter<LocalizationState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'languagePrefs',
      event.locale.languageCode,
    );

    emit(state.copyWith(
      locale: event.locale,
    ));
  }

  void _loadLocalization(
    LoadLocalization event,
    Emitter<LocalizationState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('languagePrefs');

    emit(state.copyWith(
      locale: data != null ? Locale(data) : state.locale,
    ));
  }
}
