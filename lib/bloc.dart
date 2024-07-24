import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/common/endpoint/app_endpoint.dart';
import 'package:instagram_clone/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:instagram_clone/features/auth/bloc/user/user_bloc.dart';
import 'package:instagram_clone/features/auth/repository/auth_repository.dart';
import 'package:instagram_clone/features/camera/bloc/camera/camera_bloc.dart';
import 'package:instagram_clone/features/camera/bloc/upload/upload_story_bloc.dart';
import 'package:instagram_clone/features/camera/repository/camera_repository.dart';
import 'package:instagram_clone/features/camera/repository/upload_repository.dart';
import 'package:instagram_clone/features/detail_story/bloc/detail_story/detail_story_bloc.dart';
import 'package:instagram_clone/features/detail_story/repository/detail_story_repository.dart';
import 'package:instagram_clone/features/home/bloc/home_bloc.dart';
import 'package:instagram_clone/features/home/repository/home_repository.dart';
import 'package:instagram_clone/features/maps/cubit/maps_cubit.dart';
import 'package:instagram_clone/features/maps/repository/map_repository.dart';
import 'package:instagram_clone/features/splash_screen/bloc/authenticated_bloc.dart';
import 'package:instagram_clone/service/auth_service.dart';
import 'package:instagram_clone/service/story_service.dart';
import 'package:instagram_clone/utils/camera/camera_utils.dart';
import 'package:instagram_clone/utils/preferences/preferences.dart';
import 'controller/localizations/localization_bloc.dart';

class MainBloc {
  static final _bloc = [
    RepositoryProvider(create: (context) => PreferencesHelper()),
    RepositoryProvider(create: (context) => CameraUtils(picker: ImagePicker())),
    RepositoryProvider<CameraRepository>(
        create: (context) =>
            CameraRepositoryImpl(cameraUtils: context.read<CameraUtils>())),
    BlocProvider(
        create: (context) => LocalizationBloc()..add(LoadLocalization())),
    BlocProvider(
        create: (context) => AuthBloc(
            AuthRepositoryImpl.create(), context.read<PreferencesHelper>())),
    BlocProvider(
        create: (context) =>
            AuthenticatedBloc(context.read<PreferencesHelper>())),
    BlocProvider(
        create: (context) =>
            UserBloc(context.read<PreferencesHelper>())..add(OnGetUserEvent())),
    BlocProvider(
        create: (context) => HomeBloc(
            HomeRepositoryImpl.create(), context.read<PreferencesHelper>())
          ..add(OnGetAllStoryEvent())),
    BlocProvider(
      create: (context) => DetailStoryBloc(DetailStoryRepositoryImpl.create(),
          context.read<PreferencesHelper>()),
    ),
    BlocProvider(
      create: (context) => CameraBloc(context.read<CameraRepository>()),
    ),
    BlocProvider<UploadStoryBloc>(
      create: (context) => UploadStoryBloc(
        UploadRepositoryImpl.create(),
        context.read<PreferencesHelper>(),
      ),
    ),
    BlocProvider<MapsCubit>(
      create: (context) => MapsCubit(MapRepositoryImpl.create()),
    )
  ];

  static get bloc => _bloc;
}
