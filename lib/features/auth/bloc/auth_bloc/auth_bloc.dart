import 'package:bloc/bloc.dart';
import 'package:instagram_clone/constant/app_state.dart';
import 'package:instagram_clone/features/auth/model/user.dart';
import 'package:instagram_clone/features/auth/repository/auth_repository.dart';
import 'package:instagram_clone/utils/preferences/preferences.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;
  final PreferencesHelper _helper;

  AuthBloc(this._repository, this._helper) : super(AuthState()) {
    on<AuthEvent>((event, emit) {});
    on<OnAuthLogin>((event, emit) async {
      emit(state.copyWith(status: AuthStatusState.loading));
      try {
        final data = await _repository.login(event.email, event.password);
        final user = {
          'name': data.name,
          'userId': data.userId,
          'token': data.token
        };
        await _helper.setMap('isAuth', user);
        await _helper.setPref('isToken', data.token);

        emit(state.copyWith(
          status: AuthStatusState.success,
          message: 'Success',
          result: data,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: AuthStatusState.failed,
          message: e.toString(),
        ));
      }
    });

    on<OnAuthRegister>((event, emit) async {
      emit(state.copyWith(status: AuthStatusState.loading));
      try {
        await _repository.register(event.name, event.email, event.password);
        emit(state.copyWith(
          message: 'Success',
          status: AuthStatusState.success,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: AuthStatusState.failed,
          message: e.toString(),
        ));
      }
    });
  }
}
