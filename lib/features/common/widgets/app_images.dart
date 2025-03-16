import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';

class AppImages {
  static Widget getCachedImage({required String imageUrl, required double width, required double height, BoxFit? fit}) {
    if (imageUrl.isEmpty) {
      return Container();
    }
    fit ??= BoxFit.cover;
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: Uri.encodeFull(imageUrl),
      fit: fit,
      progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
        width: width,
        height: height,
        child: SkeletonLine(
          style: SkeletonLineStyle(height: height, width: width, borderRadius: BorderRadius.circular(8)),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
