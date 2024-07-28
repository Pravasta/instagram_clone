import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:instagram_clone/common/routes/navigation.dart';
import 'package:instagram_clone/common/routes/routes_name.dart';
import 'package:instagram_clone/constant/app_colors.dart';
import 'package:instagram_clone/constant/app_text.dart';
import 'package:instagram_clone/features/home/model/story_model.dart';
import 'package:instagram_clone/widgets/button/default_button.dart';
import 'package:instagram_clone/widgets/message/bottom_sheet.dart';

import '../../../../../core/core.dart';

class ContentImageWidgetSection extends StatelessWidget {
  const ContentImageWidgetSection({super.key, required this.story});

  final ListStory story;

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context);
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 2 / 3),
          color: AppColors.blackColor,
          child: Stack(
            children: [
              CachedNetworkImage(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                fit: BoxFit.cover,
                imageUrl: story.photoUrl,
                progressIndicatorBuilder: (context, url, progress) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 1 / 3,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) => const Icon(Icons.error),
                cacheManager: CacheManager(
                  Config(
                    "cache-key-name",
                    stalePeriod: const Duration(days: 7),
                  ),
                ),
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.greyDarkColorLight,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      '1 / 3',
                      style:
                          AppText.text10.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              if (story.lat == null || story.lon == null)
                const SizedBox()
              else
                Positioned(
                  left: 12,
                  bottom: 12,
                  child: GestureDetector(
                    onTap: () {
                      showBottomContent(
                        context,
                        2 / 12,
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 30,
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: DefaultButton(
                                    title: text!.see_maps,
                                    onTap: () {
                                      Navigation.pushName(
                                        RoutesName.mapsPage,
                                        arguments: {
                                          'lat': story.lat,
                                          'lon': story.lon,
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.greyDarkColorLight,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.location_on,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
