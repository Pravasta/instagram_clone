import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/field/default_field.dart';

import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text.dart';
import '../../../../constant/url_assets.dart';

class SearchAppbarSection extends StatelessWidget {
  const SearchAppbarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.all(5.0),
          child: DefaultField(
            hintText: 'Search',
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
