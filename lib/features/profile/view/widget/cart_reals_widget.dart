import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:instagram_clone/constant/app_text.dart';

import '../../../../constant/app_colors.dart';

class CardRealsWidget extends StatelessWidget {
  const CardRealsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          CachedNetworkImage(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            fit: BoxFit.cover,
            imageUrl: 'https://picsum.photos/id/237/200/300',
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
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
            cacheManager: CacheManager(
              Config(
                "cache-key-name",
                stalePeriod: const Duration(days: 7),
              ),
            ),
          ),
          Positioned(
            left: 3,
            bottom: 3,
            child: Row(
              children: [
                const Icon(Icons.play_arrow_outlined),
                const SizedBox(width: 5),
                Text(
                  '164',
                  style: AppText.text14.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
