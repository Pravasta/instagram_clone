import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/common/routes/navigation.dart';
import 'package:instagram_clone/common/routes/routes_name.dart';
import 'package:instagram_clone/features/camera/bloc/camera/camera_bloc.dart';
import 'package:instagram_clone/features/camera/bloc/init_camera/init_camera_bloc.dart';
import 'package:instagram_clone/widgets/message/scaffold_message.dart';

class CameraBottomSection extends StatelessWidget {
  const CameraBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraBloc, CameraState>(
      builder: (context, state) {
        if (state.status == CameraStatusState.error) {
          return Center(
            child: Text(state.message),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  context.read<CameraBloc>().add(OnGalleryViewEvent());
                },
                icon: const Icon(Icons.photo, size: 30),
              ),
              IconButton(
                onPressed: () {
                  context.read<InitCameraBloc>().add(OnSwitchCamera());
                },
                icon: const Icon(Icons.cameraswitch_outlined, size: 30),
              )
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state.status == CameraStatusState.success) {
          Navigation.pushName(
            RoutesName.imageView,
            arguments: state,
          );
        }
        if (state.status == CameraStatusState.error) {
          showMessage(context, state.message);
        }
      },
    );
  }
}
