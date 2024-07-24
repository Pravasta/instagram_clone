import 'package:bloc/bloc.dart';
import 'package:instagram_clone/constant/app_state.dart';
import 'package:instagram_clone/features/auth/model/user.dart';
import 'package:instagram_clone/utils/preferences/preferences.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final PreferencesHelper _helper;

  UserBloc(this._helper) : super(UserState()) {
    on<UserEvent>((event, emit) {});
    on<OnGetUserEvent>((event, emit) async {
      emit(state.copyWith(status: UserStatusState.loading));
      try {
        final data = LoginResult.fromJson(await _helper.getMap('isAuth'));
        emit(state.copyWith(
          status: UserStatusState.success,
          user: data,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: UserStatusState.failed,
          message: 'Data gagal di Load',
        ));
      }
    });
  }
}
