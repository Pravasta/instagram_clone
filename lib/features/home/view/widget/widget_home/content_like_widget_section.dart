import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/app_colors.dart';
import 'package:instagram_clone/constant/url_assets.dart';

class ContentLikeWidgetSection extends StatelessWidget {
  const ContentLikeWidgetSection({
    super.key,
    this.multiplePost = true,
  });

  final bool multiplePost;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(UrlAssets.iconFavorite, scale: 3.5),
              const SizedBox(width: 20),
              Image.asset(UrlAssets.iconComment, scale: 3.5),
              const SizedBox(width: 20),
              Image.asset(UrlAssets.iconShare, scale: 3.5),
            ],
          ),
          multiplePost ? const Icon(Icons.more_horiz) : const SizedBox(),
          Row(
            children: [
              Image.asset(UrlAssets.iconFavorite,
                  scale: 3.5, color: AppColors.primaryDark),
              const SizedBox(width: 20),
              Image.asset(UrlAssets.iconFavorite,
                  scale: 3.5, color: AppColors.primaryDark),
              const SizedBox(width: 20),
              Image.asset(UrlAssets.iconBookmark, scale: 3.5),
            ],
          ),
        ],
      ),
    );
  }
}
