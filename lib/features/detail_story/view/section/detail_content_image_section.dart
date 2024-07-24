import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:instagram_clone/features/detail_story/model/detail_story_model.dart';
import '../../../../common/routes/navigation.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text.dart';
import '../../../../utils/datetime/convert_to_hours.dart';
import '../../../../widgets/avatar/default_avatar_widget.dart';

class DetailContentImageSection extends StatefulWidget {
  const DetailContentImageSection({
    super.key,
    this.detailStory,
  });

  final Story? detailStory;

  @override
  State<DetailContentImageSection> createState() =>
      _DetailContentImageSectionState();
}

class _DetailContentImageSectionState extends State<DetailContentImageSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..addListener(
        () {
          setState(() {});
        },
      );

    _controller.forward();
    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          Navigation.pop();
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.greyColor,
              ),
              height: MediaQuery.of(context).size.height,
              child: CachedNetworkImage(
                alignment: Alignment.center,
                fit: BoxFit.cover,
                imageUrl: widget.detailStory!.photoUrl,
                progressIndicatorBuilder: (context, url, progress) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
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
            ),
          ),
          Positioned(
            top: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  LinearProgressIndicator(
                    value: _controller.value,
                    color: AppColors.greyLightColor,
                    backgroundColor: AppColors.greyDarkColor,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      DefaultAvatarWidget(
                        size: MediaQuery.of(context).size.width * 1 / 12,
                        haveStatus: false,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.detailStory?.name ?? '',
                              style: AppText.text12
                                  .copyWith(fontWeight: FontWeight.bold)),
                          Text(
                              '${convertToHours(widget.detailStory!.createdAt.toIso8601String())} hours ago',
                              style: AppText.text10)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Text(
              widget.detailStory?.description ?? '',
              style: AppText.text16.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
