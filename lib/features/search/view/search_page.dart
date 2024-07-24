import 'package:flutter/material.dart';
import 'package:instagram_clone/features/search/view/section/search_appbar_section.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SearchAppbarSection(),
          ],
        ),
      ),
    );
  }
}
