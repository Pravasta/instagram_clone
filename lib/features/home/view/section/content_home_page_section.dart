import 'package:flutter/material.dart';
import 'package:instagram_clone/features/home/bloc/home_bloc.dart';
import '../widget/widget_home/content_describe_widget_section.dart';
import '../widget/widget_home/content_image_widget_section.dart';
import '../widget/widget_home/content_like_widget_section.dart';
import '../widget/widget_home/header_widget_section.dart';

class ContentHomePageSection extends StatelessWidget {
  const ContentHomePageSection({
    super.key,
    required this.state,
  });

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: state.story.length + (state.pages != null ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == state.story.length && state.pages != null) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: CircularProgressIndicator(),
            ),
          );
        }
        final data = state.story[index];
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // Header
              HeaderWidgetSection(story: data, index: index),
              ContentImageWidgetSection(story: data),
              const ContentLikeWidgetSection(),
              ContentDescribeWidgetSection(story: data),
            ],
          ),
        );
      },
    );
  }
}
