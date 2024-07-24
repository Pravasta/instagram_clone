import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
import '../../constant/url_assets.dart';

class DefaultAvatarWidget extends StatelessWidget {
  const DefaultAvatarWidget({
    super.key,
    this.imageUrl,
    this.haveStatus = true,
    required this.size,
  });

  final String? imageUrl;
  final double size;
  final bool haveStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(haveStatus ? 2 : 0),
      decoration: BoxDecoration(
        gradient: haveStatus ? AppColors.instagramColor : null,
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.blackColor,
        ),
        child: Container(
          alignment: Alignment.center,
          width: haveStatus ? size : size + 4,
          height: haveStatus ? size : size + 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: imageUrl == null
                  ? AssetImage(UrlAssets.imageProfile)
                  : NetworkImage(
                      imageUrl!,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
