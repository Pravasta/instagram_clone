import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/app_colors.dart';
import 'package:instagram_clone/constant/app_text.dart';
import 'package:instagram_clone/widgets/avatar/default_avatar_widget.dart';
import 'package:instagram_clone/widgets/button/default_button.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
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

    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 2 / 7 - 10,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
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
                        text('posts', 0),
                        text('followers', 667),
                        text('following', 803),
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
                  Text('Pravasta Rama Fitrayana',
                      style:
                          AppText.text14.copyWith(fontWeight: FontWeight.bold)),
                  Text('pemilik akun ini, sedang sibuk', style: AppText.text12),
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
                      title: 'Edit Profile',
                      onTap: () {},
                      elevation: 0,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: DefaultButton(
                      backgroundColor: AppColors.primaryDark,
                      height: 40,
                      title: 'Share Profile',
                      onTap: () {},
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
      ),
    );
  }
}
