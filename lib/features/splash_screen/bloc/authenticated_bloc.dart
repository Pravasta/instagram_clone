import 'package:bloc/bloc.dart';
import 'package:instagram_clone/constant/app_state.dart';
import 'package:meta/meta.dart';

import '../../../utils/preferences/preferences.dart';

part 'authenticated_event.dart';
part 'authenticated_state.dart';

class AuthenticatedBloc extends Bloc<AuthenticatedEvent, AuthenticatedState> {
  final PreferencesHelper _helper;

  AuthenticatedBloc(this._helper) : super(AuthenticatedState()) {
    on<AuthenticatedEvent>((event, emit) {});
    on<UnAuthenticated>((event, emit) async {
      await _helper.deleteToken('isAuth');
      await _helper.deleteToken('isToken');
      emit(state.copyWith(
        status: AuthenticatedStatusState.initial,
        message: 'Logout succes',
      ));
    });

    on<Authenticated>((event, emit) async {
      final token = await _helper.getMap('isAuth');
      if (token['token'] != null) {
        emit(state.copyWith(
          isAuthenticated: true,
          status: AuthenticatedStatusState.succes,
          message: 'Login Success',
        ));
      } else {
        emit(state.copyWith(
          status: AuthenticatedStatusState.error,
          isAuthenticated: false,
          message: state.message,
        ));
      }
    });
  }
}
