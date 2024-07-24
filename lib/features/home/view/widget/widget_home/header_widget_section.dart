import 'package:flutter/material.dart';
import 'package:instagram_clone/common/routes/navigation.dart';
import 'package:instagram_clone/common/routes/routes_name.dart';
import 'package:instagram_clone/features/home/model/story_model.dart';

import '../../../../../../constant/app_text.dart';
import '../../../../../../widgets/avatar/default_avatar_widget.dart';

class HeaderWidgetSection extends StatelessWidget {
  const HeaderWidgetSection(
      {super.key, required this.story, required this.index});

  final ListStory story;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 6, bottom: 6),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigation.pushName(RoutesName.detailStory, arguments: story.id);
            },
            child: DefaultAvatarWidget(
              size: MediaQuery.of(context).size.width * 1 / 12,
              imageUrl: 'https://picsum.photos/id/${index + 1}/200/300',
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              story.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: AppText.text14.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_outlined,
              )),
        ],
      ),
    );
  }
}
