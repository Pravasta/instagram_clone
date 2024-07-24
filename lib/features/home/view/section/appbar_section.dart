import 'package:flutter/material.dart';

import '../../../../constant/url_assets.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({
    super.key,
  });

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
            Image.asset(
              UrlAssets.imageInstagramText,
              scale: 14,
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {},
                    child: Image.asset(UrlAssets.iconFavorite, scale: 4)),
                const SizedBox(width: 20),
                GestureDetector(
                    onTap: () {},
                    child: Image.asset(UrlAssets.iconMessage, scale: 4)),
              ],
            ),
          ],
        ),
      )),
    );
  }
}