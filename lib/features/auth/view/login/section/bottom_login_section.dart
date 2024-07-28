import 'package:flutter/material.dart';
import 'package:instagram_clone/common/routes/navigation.dart';
import 'package:instagram_clone/common/routes/routes_name.dart';
import 'package:instagram_clone/constant/app_colors.dart';
import 'package:instagram_clone/constant/app_text.dart';
import 'package:instagram_clone/constant/url_assets.dart';
import 'package:instagram_clone/core/core.dart';

class BottomLoginSection extends StatelessWidget {
  const BottomLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 1 / 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Instagram ${text!.from}',
              style: AppText.text14.copyWith(color: AppColors.greyDarkColor),
            ),
            Image.asset(
              UrlAssets.imageMeta,
              scale: 35,
            ),
          ],
        ),
      ],
    );
  }
}
