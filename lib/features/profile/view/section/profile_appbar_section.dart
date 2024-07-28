import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/common/routes/navigation.dart';
import 'package:instagram_clone/common/routes/routes_name.dart';
import 'package:instagram_clone/constant/app_colors.dart';
import 'package:instagram_clone/constant/app_state.dart';
import 'package:instagram_clone/constant/app_text.dart';
import 'package:instagram_clone/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:instagram_clone/features/auth/bloc/user/user_bloc.dart';
import 'package:instagram_clone/features/auth/model/user.dart';
import 'package:instagram_clone/features/splash_screen/bloc/authenticated_bloc.dart';

import '../../../../constant/url_assets.dart';
import '../../../../widgets/message/scaffold_message.dart';

class ProfileAppbarSection extends StatelessWidget {
  const ProfileAppbarSection({super.key, this.data});

  final LoginResult? data;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(data?.name ?? '',
                  style: AppText.text18.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
              Row(
                children: [
                  GestureDetector(
                      onTap: () async {
                        final cameras = await availableCameras();
                        Navigation.pushName(
                          RoutesName.cameraPage,
                          arguments: cameras,
                        );
                      },
                      child: Image.asset(
                        UrlAssets.iconAdd,
                        scale: 4,
                        color: AppColors.whiteColor,
                      )),
                  BlocListener<AuthenticatedBloc, AuthenticatedState>(
                    listener: (context, state) {
                      if (state.status == AuthenticatedStatusState.initial) {
                        Navigation.pushNamedAndRemoveUntil(RoutesName.login);
                      }
                    },
                    child: IconButton(
                        onPressed: () => context
                            .read<AuthenticatedBloc>()
                            .add(UnAuthenticated()),
                        icon: const Icon(Icons.logout)),
                  ),
                  GestureDetector(
                      onTap: () => showMessage(
                          context, 'this Features it\'s coming soon'),
                      child: Image.asset(
                        UrlAssets.iconMenu,
                        scale: 4,
                        color: AppColors.whiteColor,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
