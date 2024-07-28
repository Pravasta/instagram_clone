import 'package:flutter/material.dart';

import '../widget/card_post_widget.dart';

class ProfileMyPostTagByUser extends StatelessWidget {
  const ProfileMyPostTagByUser({super.key});

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
          isPostImage: true,
        );
      },
    );
  }
}
