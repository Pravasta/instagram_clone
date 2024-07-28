import 'package:flutter/material.dart';
import 'package:instagram_clone/features/profile/view/widget/cart_reals_widget.dart';

import '../widget/card_post_widget.dart';

class ProfileMyPostReals extends StatelessWidget {
  const ProfileMyPostReals({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.6,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return const CardRealsWidget();
      },
    );
  }
}
