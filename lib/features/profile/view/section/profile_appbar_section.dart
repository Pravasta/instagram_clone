import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/app_colors.dart';
import 'package:instagram_clone/constant/app_text.dart';

import '../../../../constant/url_assets.dart';

class ProfileAppbarSection extends StatelessWidget {
  const ProfileAppbarSection({super.key});

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
              Text('Pravasta',
                  style: AppText.text18.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        UrlAssets.iconAdd,
                        scale: 4,
                        color: AppColors.whiteColor,
                      )),
                  const SizedBox(width: 20),
                  GestureDetector(
                      onTap: () {},
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
