import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:instagram_clone/constant/url_assets.dart';

import '../../../../constant/app_colors.dart';

class CardPostWidget extends StatelessWidget {
  const CardPostWidget({
    super.key,
    this.isPin = false,
    this.isPostImage = false,
    this.isReals = false,
  });

  final bool isPin;
  final bool isPostImage;
  final bool isReals;

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
            right: 3,
            top: 3,
            child: isPin
                ? const Icon(Icons.push_pin, size: 25)
                : isPostImage
                    ? Image.asset(
                        UrlAssets.iconPost,
                        scale: 4,
                      )
                    : isReals
                        ? Image.asset(
                            UrlAssets.iconReals,
                            scale: 4,
                          )
                        : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
