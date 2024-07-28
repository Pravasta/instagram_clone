import 'package:flutter/material.dart';
import 'package:instagram_clone/features/auth/bloc/user/user_bloc.dart';
import 'package:instagram_clone/features/home/bloc/home_bloc.dart';
import 'package:instagram_clone/features/profile/view/content/profile_my_post.dart';
import 'package:instagram_clone/features/profile/view/content/profile_my_post_reals.dart';
import 'package:instagram_clone/features/profile/view/content/profile_my_post_tag_by_user.dart';
import 'package:instagram_clone/features/profile/view/section/profile_appbar_section.dart';

import 'section/profile_content_section.dart';
import 'section/profile_header_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(OnGetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          final data = state.user;

          return Scaffold(
            body: SafeArea(
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    ProfileAppbarSection(data: data),
                    ProfileHeaderSection(data: data),
                    const ProfileContentSection(),
                  ];
                },
                body: const TabBarView(
                  children: [
                    ProfileMyPost(),
                    ProfileMyPostReals(),
                    ProfileMyPostTagByUser(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
