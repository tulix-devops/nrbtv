import 'package:nrbtv/src/bloc/epg_cubit/epg_cubit.dart';
import 'package:nrbtv/src/data/models/content/seasons_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/data/models/content/tv_schedule_model.dart';
import 'package:river_player/river_player.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:nrbtv/src/index.dart';
import 'package:commons/commons.dart';
import 'package:nrbtv/src/ui/widgets/app_video_player/widgets/black_background.dart';
import 'package:shimmer/shimmer.dart' as DefaultShimmer;
import 'package:nrbtv/src/ui/widgets/app_video_player/widgets/dvr.dart';

class VodFullScreen extends StatefulWidget {
  const VodFullScreen({super.key, required this.controller});

  final BetterPlayerController controller;

  @override
  State<VodFullScreen> createState() => _VodFullScreenState();
}

class _VodFullScreenState extends State<VodFullScreen> {
  late final FocusNode playPauseFocus;
  late final FocusNode arrowBackFocus;
  late final FocusNode dvrButtonFocus;

  ({int selectedPage, int selectedItemIndex})? selectedLinkIndexes;

  bool isSeasonsOpen = false;

  void openDvr() {
    setState(() {
      isSeasonsOpen = true;
    });
  }

  @override
  void initState() {
    dvrButtonFocus = FocusNode();

    playPauseFocus = FocusNode(
      onKeyEvent: (node, event) {
        bool isInitialized = widget.controller.isVideoInitialized() ?? false;
        if (event is KeyDownEvent || event is KeyRepeatEvent) {
          final Duration currentPosition =
              widget.controller.videoPlayerController!.value.position;
          context.read<VideoPlayerCubit>().handleVisibility();

          if (event.logicalKey == LogicalKeyboardKey.arrowLeft &&
              isInitialized) {
            widget.controller
                .seekTo(currentPosition - const Duration(seconds: 30));
            return KeyEventResult.handled;
          }
          if (event.logicalKey == LogicalKeyboardKey.arrowRight &&
              isInitialized) {
            widget.controller
                .seekTo(currentPosition + const Duration(seconds: 30));
            return KeyEventResult.handled;
          }
          if (event.logicalKey == LogicalKeyboardKey.goBack) {
            arrowBackFocus.requestFocus();
            return KeyEventResult.ignored;
          }
        }
        return KeyEventResult.ignored;
      },
    );
    arrowBackFocus = FocusNode(
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent) {
          return KeyEventResult.ignored;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          context.read<VideoPlayerCubit>().handleVisibility();
          dvrButtonFocus.requestFocus();
          return KeyEventResult.handled;
        }

        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          context.read<VideoPlayerCubit>().handleVisibility();
          return KeyEventResult.skipRemainingHandlers;
        }

        if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          context.read<VideoPlayerCubit>().handleVisibility();
          playPauseFocus.requestFocus();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
    );
    playPauseFocus.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    arrowBackFocus.dispose();
    playPauseFocus.dispose();
    super.dispose();
  }

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
    setState(() {});
  }

  void _closeDvr() {
    isSeasonsOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, List<TvScheduleModel>>? seriesData =
        context.read<EpgCubit>().state.epgContent;
    final bool isSeriesAvailable = seriesData != null && seriesData.isNotEmpty;

    final Positioned blackBackground = Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.65),
              Colors.black.withOpacity(0.65)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );

    return BlocConsumer<VideoPlayerCubit, VideoPlayerState>(
      listenWhen: (previous, current) =>
          previous.isVisible != current.isVisible,
      listener: (context, state) {
        playPauseFocus.requestFocus();
      },
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            if (state.isVisible) const BlackBackground(),
            // if (isSeasonsOpen && isSeriesAvailable) ...[
            //   blackBackground,
            //   // Dvr(
            //   //   controller: widget.controller,
            //   //   callback: _closeDvr,
            //   // ),
            // ],
            if (!isSeasonsOpen) ...[
              Positioned(
                left: 60,
                top: 20,
                child: VideoButton(
                  onPressed: (ctx) {
                    context.pop();
                  },
                  icon: Assets.arrowLeft,
                  focusNode: arrowBackFocus,
                ),
              ),
              // if (isSeriesAvailable)
              //   Positioned(
              //     right: 60,
              //     top: 20,
              //     child: VideoButton(
              //       focusNode: dvrButtonFocus,
              //       icon: Assets.moreCircles,
              //       onPressed: (_) {
              //         openDvr();
              //         context.read<VideoPlayerCubit>().changeVisibility(true);
              //       },
              //     ),
              //   ),
              Positioned(
                left: 10,
                right: 10,
                bottom: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        flex: 2,
                        child: VideoButton(
                          onPressed: (context) {
                            _togglePlayPause(context);
                            context.read<VideoPlayerCubit>().handleVisibility();
                          },
                          icon: _playIcon(),
                          focusNode: playPauseFocus,
                        )),
                    Flexible(
                      flex: 7,
                      child: getVodSeekbar(context),
                    )
                  ],
                ),
              ),
            ]
          ],
        );
      },
    );
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
