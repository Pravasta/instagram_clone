import 'package:flutter/material.dart';

import '../../../../constant/url_assets.dart';
import '../../../../widgets/field/default_field.dart';

class DetailContentCommentSection extends StatelessWidget {
  const DetailContentCommentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Expanded(
            child: DefaultField(hintText: 'add a comment'),
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              Image.asset(
                UrlAssets.iconFavorite,
                scale: 3.5,
              ),
              const SizedBox(width: 10),
              Image.asset(
                UrlAssets.iconShare,
                scale: 3.5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
