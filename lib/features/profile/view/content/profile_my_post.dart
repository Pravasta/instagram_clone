import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/app_colors.dart';

import '../widget/card_post_widget.dart';

class ProfileMyPost extends StatelessWidget {
  const ProfileMyPost({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 1,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return const CardPostWidget(
          isPin: true,
        );
      },
    );
  }
}
