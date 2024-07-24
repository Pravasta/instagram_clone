import 'package:flutter/material.dart';
import 'package:instagram_clone/features/profile/view/section/profile_appbar_section.dart';

import 'section/profile_content_section.dart';
import 'section/profile_header_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            ProfileAppbarSection(),
            ProfileHeaderSection(),
            ProfileContentSection(),
          ],
        ),
      ),
    );
  }
}
