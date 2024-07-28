import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/app_colors.dart';
import 'package:instagram_clone/constant/app_text.dart';
import 'package:instagram_clone/features/auth/model/user.dart';
import 'package:instagram_clone/widgets/avatar/default_avatar_widget.dart';
import 'package:instagram_clone/widgets/button/default_button.dart';
import 'package:instagram_clone/widgets/message/scaffold_message.dart';

import '../../../../core/core.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({super.key, this.data});
  final LoginResult? data;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);

    Column text(String label, int count) {
      return Column(
        children: [
          Text('$count',
              style: AppText.text16.copyWith(fontWeight: FontWeight.bold)),
          Text(label,
              style: AppText.text12.copyWith(fontWeight: FontWeight.w600)),
        ],
      );
    }

    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE_AND_FOLLOWING
            Row(
              children: [
                DefaultAvatarWidget(
                  size: MediaQuery.of(context).size.width * 1 / 5,
                  haveStatus: false,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      text(localization!.post, 0),
                      text(localization.followers, 900),
                      text(localization.following, 24),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            // NAME
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data?.name ?? '',
                    style:
                        AppText.text14.copyWith(fontWeight: FontWeight.bold)),
                Text(data?.userId ?? '', style: AppText.text12),
              ],
            ),
            const SizedBox(height: 10),
            // BUTTON
            Row(
              children: [
                Expanded(
                  child: DefaultButton(
                    height: 40,
                    backgroundColor: AppColors.primaryDark,
                    title: localization.edit_profile,
                    onTap: () =>
                        showMessage(context, 'this Features it\'s coming soon'),
                    elevation: 0,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: DefaultButton(
                    backgroundColor: AppColors.primaryDark,
                    height: 40,
                    title: localization.share_profile,
                    onTap: () =>
                        showMessage(context, 'this Features it\'s coming soon'),
                    elevation: 0,
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                          width: 1.5, color: AppColors.greyDarkColorLight),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Icon(Icons.person_add_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
