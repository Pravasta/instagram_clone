import 'package:flutter/material.dart';
import 'package:instagram_clone/core/core.dart';

import '../../../../../common/routes/navigation.dart';
import '../../../../../common/routes/routes_name.dart';
import '../../../../../constant/app_colors.dart';
import '../../../../../constant/app_text.dart';
import '../../../../../constant/url_assets.dart';

class BottomRegisterSection extends StatelessWidget {
  const BottomRegisterSection({super.key});

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
