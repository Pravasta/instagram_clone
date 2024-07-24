import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/constant/app_state.dart';
import 'package:instagram_clone/constant/app_text.dart';
import 'package:instagram_clone/features/detail_story/bloc/detail_story/detail_story_bloc.dart';
import 'package:instagram_clone/features/detail_story/view/section/detail_content_comment_section.dart';
import 'package:instagram_clone/features/detail_story/view/section/detail_content_image_section.dart';

class DetailStoryPage extends StatefulWidget {
  const DetailStoryPage({super.key, required this.id});

  final String id;

  @override
  State<DetailStoryPage> createState() => _DetailStoryPageState();
}

class _DetailStoryPageState extends State<DetailStoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<DetailStoryBloc>().add(OnGetDetailStory(id: widget.id));
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<DetailStoryBloc, DetailStoryState>(
          builder: (context, state) {
            final detailStory = state.story;
            if (state.status == DetailStoryStatusState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.status == DetailStoryStatusState.error) {
              return Center(
                child: Text(
                  state.message,
                  style: AppText.text12,
                ),
              );
            }

            if (state.status == DetailStoryStatusState.succes) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    DetailContentImageSection(detailStory: detailStory),
                    const DetailContentCommentSection(),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
