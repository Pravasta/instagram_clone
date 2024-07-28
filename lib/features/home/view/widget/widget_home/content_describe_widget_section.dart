import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/app_colors.dart';
import 'package:instagram_clone/constant/app_text.dart';
import 'package:instagram_clone/features/home/model/story_model.dart';
import 'package:instagram_clone/utils/datetime/convert_to_hours.dart';
import 'package:instagram_clone/widgets/avatar/default_avatar_widget.dart';

import '../../../../../core/core.dart';

class ContentDescribeWidgetSection extends StatelessWidget {
  const ContentDescribeWidgetSection({super.key, required this.story});

  final ListStory story;

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LIKES
            Text(
              '86.032 ${text!.likes}',
              style: AppText.text12.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            // Describtion
            ExpandableText(
              story.description,
              prefixText: story.name,
              prefixStyle: AppText.text12.copyWith(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              style: AppText.text12,
              expandText: 'more',
            ),
            const SizedBox(height: 5),
            // Our Comment
            Column(
              children: [
                Row(
                  children: [
                    DefaultAvatarWidget(
                      size: MediaQuery.of(context).size.width * 1 / 15,
                      haveStatus: false,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: text.add_comment,
                          hintStyle: AppText.text12
                              .copyWith(color: AppColors.greyColor),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                        '${convertToHours(story.createdAt.toIso8601String())} ${text.hours_ago}',
                        style: AppText.text10
                            .copyWith(color: AppColors.greyColor)),
                    const SizedBox(width: 10),
                    Text('See translation',
                        style: AppText.text10.copyWith(
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
