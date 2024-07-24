import 'package:flutter/material.dart';
import 'package:instagram_clone/common/routes/navigation.dart';
import 'package:instagram_clone/common/routes/routes_name.dart';
import 'package:instagram_clone/constant/app_text.dart';
import '../../../../widgets/avatar/default_avatar_widget.dart';
import '../../model/story_model.dart';

class ContentStoriesHomeSection extends StatelessWidget {
  const ContentStoriesHomeSection({super.key, required this.story});

  final List<ListStory> story;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.width * 1 / 4 + 8,
      flexibleSpace: FlexibleSpaceBar(
        background: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Column(
                  children: [
                    DefaultAvatarWidget(
                      size: MediaQuery.of(context).size.width * 1 / 6,
                      haveStatus: false,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Pravasta',
                      style:
                          AppText.text12.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: story.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigation.pushName(
                        RoutesName.detailStory,
                        arguments: story[index].id,
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 5 : 0,
                        right: index == 9 ? 0 : 8,
                      ),
                      child: Column(
                        children: [
                          DefaultAvatarWidget(
                            size: MediaQuery.of(context).size.width * 1 / 6,
                            haveStatus: true,
                            imageUrl: 'https://picsum.photos/id/$index/200/300',
                          ),
                          const SizedBox(height: 8),
                          Text(
                            story[index].name,
                            style: AppText.text12
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
