import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/app_colors.dart';
import 'package:instagram_clone/constant/url_assets.dart';
import 'package:instagram_clone/features/profile/view/content/profile_my_post.dart';

class ProfileContentSection extends StatefulWidget {
  const ProfileContentSection({super.key});

  @override
  State<ProfileContentSection> createState() => _ProfileContentSectionState();
}

class _ProfileContentSectionState extends State<ProfileContentSection> {
  final List<String> tab = [
    UrlAssets.iconGrid,
    UrlAssets.iconReals,
    UrlAssets.iconTag,
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: TabBar(
        indicatorColor: AppColors.whiteColor,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerHeight: 0.2,
        dividerColor: AppColors.greyDarkColor,
        physics: const NeverScrollableScrollPhysics(),
        tabs: tab.map((e) {
          return Tab(
            icon: Image.asset(e, width: 26, color: AppColors.whiteColor),
          );
        }).toList(),
      ),
    );
  }
}
