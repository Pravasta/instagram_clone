import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/common/routes/navigation.dart';
import 'package:instagram_clone/common/routes/routes_name.dart';
import 'package:instagram_clone/constant/app_state.dart';
import 'package:instagram_clone/constant/app_text.dart';
import 'package:instagram_clone/constant/url_assets.dart';
import 'package:instagram_clone/features/splash_screen/bloc/authenticated_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<AuthenticatedBloc>().add(Authenticated());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticatedBloc, AuthenticatedState>(
      listener: (context, state) async {
        if (state.status == AuthenticatedStatusState.succes &&
            state.isAuthenticated == true) {
          await Future.delayed(const Duration(seconds: 3));
          Navigation.pushNamedAndRemoveUntil(RoutesName.mainNavigation);
        }
        if (state.status == AuthenticatedStatusState.error &&
            state.isAuthenticated == false) {
          await Future.delayed(const Duration(seconds: 3));
          Navigation.pushNamedAndRemoveUntil(RoutesName.login);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(),
                Image.asset(
                  UrlAssets.imageInstagram,
                  scale: 11,
                ),
                Column(
                  children: [
                    Text(
                      'From',
                      style: AppText.text16,
                    ),
                    Image.asset(
                      UrlAssets.imageMeta,
                      scale: 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
