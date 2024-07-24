import 'package:flutter/material.dart';

import '../../../../constant/app_colors.dart';

class ButtonCameraWidget extends StatelessWidget {
  const ButtonCameraWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.whiteColor,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 1 / 5,
          height: MediaQuery.of(context).size.width * 1 / 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.whiteColor,
            border: Border.all(
              width: 3,
              color: AppColors.primaryDark,
            ),
          ),
        ),
      ),
    );
  }
}
