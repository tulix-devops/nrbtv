import 'package:flutter/material.dart';
import 'package:nrbtv/src/data/models/content/content.dart';

import 'package:ui_kit/ui_kit.dart';

class VodAppCard extends StatelessWidget {
  const VodAppCard({
    super.key,
    required this.video,
    required this.isSelected,
    this.onPressed,
    this.onFocus,
  });
  final ContentModel video;
  final bool isSelected;
  final void Function(BuildContext context, ContentModel vod)? onPressed;
  final void Function(BuildContext context, ContentModel vod)? onFocus;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      isSelected: isSelected,
      onTap: () {
        if (onPressed == null) return;

        onPressed!(context, video);
      },
      onFocus: () {
        if (onFocus == null) return;

        onFocus!(context, video);
      },
      content: Text(
        video.title,
        style: tvCardTextStyle.white,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      image: video.images.getThumbnail(),
    );
  }
}
