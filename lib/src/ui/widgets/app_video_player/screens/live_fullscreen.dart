import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:river_player/river_player.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:nrbtv/src/index.dart';
import 'package:nrbtv/src/ui/widgets/app_video_player/widgets/black_background.dart';

class LiveFullscreen extends StatefulWidget {
  const LiveFullscreen({super.key, required this.controller});

  final BetterPlayerController controller;

  @override
  State<LiveFullscreen> createState() => _LiveFullscreenState();
}

class _LiveFullscreenState extends State<LiveFullscreen> {
  final FocusNode arrowBackFocus = FocusNode();
  late final FocusNode playPauseFocus = FocusNode(
    onKeyEvent: (node, event) {
      if (event is KeyDownEvent) {
        context.read<VideoPlayerCubit>().handleVisibility();
        if (event.logicalKey == LogicalKeyboardKey.goBack) {
          arrowBackFocus.requestFocus();
          return KeyEventResult.handled;
        }
      }
      return KeyEventResult.ignored;
    },
  );
  String _playIcon() {
    if (widget.controller.isPlaying() != null) {
      return widget.controller.isPlaying()!
          ? Assets.videoPause
          : Assets.videoPlay;
    }

    return Assets.videoPause;
  }

  void _togglePlayPause(BuildContext context) {
    final isPlaying = widget.controller.isPlaying() ?? false;
    isPlaying ? widget.controller.pause() : widget.controller.play();
    context.read<VideoPlayerCubit>().handleVisibility();
    setState(() {});
  }

  @override
  void initState() {
    playPauseFocus.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    arrowBackFocus.dispose();
    playPauseFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VideoPlayerCubit, VideoPlayerState>(
      listenWhen: (previous, current) =>
          previous.isVisible != current.isVisible,
      listener: (context, state) {
        playPauseFocus.requestFocus();
      },
      child: Stack(
        children: [
          if (context.read<VideoPlayerCubit>().state.isVisible)
            const BlackBackground(),
          Positioned(
            left: 70,
            right: 60,
            bottom: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoButton(
                  onPressed: (ctx) {
                    _togglePlayPause(ctx);
                  },
                  icon: _playIcon(),
                  focusNode: playPauseFocus,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      )),
                  child: Text(
                    'LIVE',
                    style: TextStyles.bodyLarge.surface(context),
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
