import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:river_player/river_player.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:nrbtv/src/index.dart';

class Seekbar extends StatefulWidget {
  const Seekbar({super.key, required this.controller, required this.isLive});
  const Seekbar.live({super.key, required this.controller}) : isLive = true;
  const Seekbar.vod({super.key, required this.controller}) : isLive = false;

  final bool isLive;
  final BetterPlayerController controller;

  @override
  State<Seekbar> createState() => _SeekbarState();
}

class _SeekbarState extends State<Seekbar> {
  late FocusNode focusNode;
  @override
  void initState() {
    focusNode = FocusNode()..requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isLive ? getLiveSeekbar(context) : getVodSeekbar(context);
  }

  Widget getLiveSeekbar(BuildContext context) {
    return ValueListenableBuilder<VideoPlayerValue>(
        valueListenable: widget.controller.videoPlayerController!,
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoSeekbar(
                  controller: widget.controller,
                  focusNode: focusNode,
                )
              ],
            ),
          );
        });
  }

  Widget getVodSeekbar(BuildContext context) {
    return ValueListenableBuilder<VideoPlayerValue>(
      valueListenable: widget.controller.videoPlayerController!,
      builder: (context, value, child) {
        final String duration = value.duration.formatDuration();
        final String position = value.position.formatDuration();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                position,
                style: TextStyles.bodyMediumBold.surface(context),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: VideoSeekbar(
                    focusNode: focusNode,
                    controller: widget.controller,
                  ),
                ),
              ),
              Text(
                duration,
                style: TextStyles.bodyMediumBold.surface(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
