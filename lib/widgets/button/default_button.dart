import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
import '../../constant/app_text.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.title,
    this.color,
    this.width = double.infinity,
    this.height = 45,
    this.backgroundColor = AppColors.inActiveBlue,
    required this.onTap,
    this.elevation = 3,
    this.iconUrl,
  });

  final String title;
  final Color? color;
  final double width, height;
  final Color backgroundColor;
  final Function() onTap;
  final double elevation;
  final String? iconUrl;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: AppColors.greyDarkColorLight,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: backgroundColor,
      ),
      onPressed: onTap,
      child: iconUrl != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  iconUrl!,
                  width: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: AppText.text14.copyWith(
                    color: color,
                  ),
                ),
              ],
            )
          : Text(
              title,
              style: AppText.text14.copyWith(
                color: color,
              ),
            ),
    );
  }
}
