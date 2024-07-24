import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/features/camera/bloc/camera/camera_bloc.dart';
import 'package:instagram_clone/features/camera/bloc/init_camera/init_camera_bloc.dart';
import '../widget/button_camera_widget.dart';
import '../widget/button_setting_camera.dart';
import '../../../../constant/app_colors.dart';

class CameraPageSection extends StatelessWidget {
  const CameraPageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitCameraBloc, InitCameraState>(
      builder: (context, state) {
        if (state.status == InitCameraStatusState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.status == InitCameraStatusState.error) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state.status == InitCameraStatusState.success) {
          return Expanded(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.blueDark,
                        ),
                        child: state.controller == null
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : CameraPreview(state.controller!),
                      ),
                      const ButtonSettingCamera(),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<CameraBloc>().add(OnButtonCameraClickEvent());
                  },
                  child: const ButtonCameraWidget(),
                ),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
