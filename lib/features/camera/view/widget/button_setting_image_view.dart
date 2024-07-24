import 'package:flutter/material.dart';
import 'package:instagram_clone/common/routes/routes_name.dart';
import 'package:instagram_clone/constant/app_colors.dart';
import 'package:instagram_clone/widgets/message/bottom_sheet.dart';
import 'package:instagram_clone/widgets/message/scaffold_message.dart';

import '../../../../common/routes/navigation.dart';

class ButtonSettingImageView extends StatelessWidget {
  const ButtonSettingImageView({super.key, required this.onDataReceived});

  final Function(Map<String, dynamic>) onDataReceived;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      right: 5,
      left: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[700]!.withOpacity(0.6),
            ),
            child: IconButton(
              onPressed: () {
                Navigation.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 22,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[700]!.withOpacity(0.6),
            ),
            child: IconButton(
              onPressed: () async {
                final result =
                    await Navigation.pushName(RoutesName.mapsPickerPage);

                if (result != null) {
                  onDataReceived(result);
                }
              },
              icon: const Icon(
                Icons.location_on,
                size: 22,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[700]!.withOpacity(0.6),
            ),
            child: IconButton(
              onPressed: () {
                showMessage(context, 'Features is Comming Soon');
              },
              icon: const Icon(
                Icons.music_note,
                size: 22,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
