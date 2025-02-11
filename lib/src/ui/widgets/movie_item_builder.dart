import 'package:flutter/material.dart';
import 'package:ui_kit/widgets/app_card.dart';
import 'package:nrbtv/src/data/models/content/content.dart';

class MovieItemBuilder extends StatefulWidget {
  const MovieItemBuilder(
      {super.key,
      required this.video,
      required this.callback,
      this.focusOnItem = false});

  final ContentModel video;
  final void Function() callback;
  final bool focusOnItem;
  @override
  State<MovieItemBuilder> createState() => MovieItemBuilderState();
}

class MovieItemBuilderState extends State<MovieItemBuilder> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    if (widget.focusOnItem) {
      _focusNode.requestFocus();
    }

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          bottom: 16,
        ),
        child: AppCard(
          focusNode: _focusNode,
          onTap: widget.callback,
          content: Text(widget.video.title),
          image: widget.video.images.getThumbnail(),
        ));
  }
}
