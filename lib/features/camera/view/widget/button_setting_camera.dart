import 'package:flutter/material.dart';

import '../../../../common/routes/navigation.dart';

class ButtonSettingCamera extends StatelessWidget {
  const ButtonSettingCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      right: 5,
      left: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigation.pop();
            },
            icon: const Icon(Icons.cancel, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.flash_off, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings, size: 30),
          ),
        ],
      ),
    );
  }
}
