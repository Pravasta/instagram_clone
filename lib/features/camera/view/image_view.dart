import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/common/routes/routes_name.dart';
import 'package:instagram_clone/constant/app_colors.dart';
import 'package:instagram_clone/constant/app_text.dart';
import 'package:instagram_clone/features/camera/bloc/upload/upload_story_bloc.dart';
import 'package:instagram_clone/features/camera/view/widget/button_setting_image_view.dart';
import 'package:instagram_clone/widgets/field/default_field.dart';
import 'package:instagram_clone/widgets/message/scaffold_message.dart';

import '../../home/bloc/home_bloc.dart';
import '../bloc/camera/camera_bloc.dart';

class ImageView extends StatefulWidget {
  const ImageView({super.key, required this.data});

  final CameraState data;

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  final descriptionC = TextEditingController();
  Map<String, dynamic> receivedData = {};

  void _handleDataReceived(Map<String, dynamic> data) {
    receivedData = data;
    print(receivedData);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    descriptionC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // IMAGE SHOW
              Expanded(
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        _showImage(),
                        ButtonSettingImageView(
                            onDataReceived: _handleDataReceived),
                        if (receivedData['lat'] == null ||
                            receivedData['lon'] == null)
                          const SizedBox()
                        else
                          location(context),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // BUTTON POST
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DefaultField(
                        hintText: 'Add Description',
                        controller: descriptionC,
                      ),
                    ),
                    _buttonUpload()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget location(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          color: AppColors.blueDark,
        ),
        child: Text(
          receivedData['placeMark'],
          textAlign: TextAlign.center,
          style: AppText.text16,
        ),
      ),
    );
  }

  Widget _buttonUpload() {
    return BlocConsumer<UploadStoryBloc, UploadStoryState>(
      listener: (context, UploadStoryState state) {
        if (state.status == UploadStoryStatusState.failed) {
          showMessage(context, state.message);
        }
        if (state.status == UploadStoryStatusState.success) {
          context.read<HomeBloc>().add(OnRefreshStoryEvent());
          Navigator.of(context).pushNamedAndRemoveUntil(
            RoutesName.mainNavigation,
            (route) => false,
          );
          showMessage(context, state.message);
        }
      },
      builder: (context, state) {
        if (state.status == UploadStoryStatusState.loading) {
          return const CircularProgressIndicator();
        }

        return IconButton(
          onPressed: () async {
            final image = widget.data.imageFile;
            final bloc = context.read<UploadStoryBloc>();
            final bytes = await image!.readAsBytes();
            final fileName = image.name;

            bloc.add(OnUploadStory(
              bytes: bytes,
              fileName: fileName,
              description: descriptionC.text,
              lat: receivedData['lat'],
              lon: receivedData['lon'],
            ));
          },
          icon: const Icon(Icons.arrow_forward_ios, size: 30),
        );
      },
    );
  }

  _showImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: kIsWeb
              ? NetworkImage(
                  widget.data.imagePath!,
                )
              : FileImage(
                  File(
                    widget.data.imagePath!,
                  ),
                ),
        ),
      ),
    );
  }
}
