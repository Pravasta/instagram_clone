import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/common/routes/routes_name.dart';
import 'package:instagram_clone/features/auth/view/login/login_page.dart';
import 'package:instagram_clone/features/camera/view/image_view.dart';
import 'package:instagram_clone/features/detail_story/view/detail_story_page.dart';
import 'package:instagram_clone/features/main_navigation/view/main_navigation_page.dart';
import 'package:instagram_clone/features/maps/view/maps_page.dart';
import 'package:instagram_clone/features/maps/view/maps_picker_page.dart';
import '../../constant/app_text.dart';
import '../../features/auth/view/register/register_page.dart';
import '../../features/camera/bloc/camera/camera_bloc.dart';
import '../../features/camera/view/camera_page.dart';
import '../../features/splash_screen/view/splash_page.dart';

class RoutesHandler {
  final String initialRoutes = RoutesName.initial;
  static const initialNavbarVisibility = true;

  static MaterialPageRoute get _emptyPage {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Text('404 not found',
                style: AppText.text24.copyWith(
                  fontWeight: FontWeight.bold,
                )),
          ),
        );
      },
    );
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
          settings: settings,
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
          settings: settings,
        );
      case RoutesName.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterPage(),
          settings: settings,
        );
      case RoutesName.mainNavigation:
        return MaterialPageRoute(
          builder: (context) => const MainNavigationPage(),
          settings: settings,
        );
      case RoutesName.detailStory:
        final data = settings.arguments;
        if (data == null || data is! String) return _emptyPage;
        return MaterialPageRoute(
          builder: (context) => DetailStoryPage(id: data),
          settings: settings,
        );
      case RoutesName.cameraPage:
        final cameras = settings.arguments;
        if (cameras == null || cameras is! List<CameraDescription>) {
          return _emptyPage;
        }
        return MaterialPageRoute(
          builder: (context) => CameraPage(cameras: cameras),
          settings: settings,
        );
      case RoutesName.imageView:
        final imagePath = settings.arguments;
        if (imagePath == null || imagePath is! CameraState) {
          return _emptyPage;
        }
        return MaterialPageRoute(
          builder: (context) => ImageView(data: imagePath),
          settings: settings,
        );
      case RoutesName.mapsPage:
        final location = settings.arguments;
        if (location == null || location is! Map<String, dynamic>) {
          return _emptyPage;
        }
        return MaterialPageRoute(
          builder: (context) => MapsPage(location: location),
          settings: settings,
        );
      case RoutesName.mapsPickerPage:
        return MaterialPageRoute(
          builder: (context) => const MapsPickerPage(),
          settings: settings,
        );

      default:
        return _emptyPage;
    }
  }
}
