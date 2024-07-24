import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/app_colors.dart';

class ProfileContentSection extends StatelessWidget {
  const ProfileContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        background: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.abc),
                ),
                Tab(
                  icon: Icon(Icons.abc),
                ),
                Tab(
                  icon: Icon(Icons.abc),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
