import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/index.dart';
import 'package:nrbtv/src/ui/widgets/app_video_player/widgets/black_background.dart';
import 'package:river_player/river_player.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:commons/commons.dart';

class MobilePlayerContainer extends StatefulWidget {
  const MobilePlayerContainer({super.key, required this.video});

  final ContentModel video;

  @override
  State<MobilePlayerContainer> createState() => _MobilePlayerContainerState();
}

class _MobilePlayerContainerState extends State<MobilePlayerContainer> {
  late final BetterPlayerController controller;

  @override
  void initState() {
    final dataSource = BetterPlayerDataSource.network(
      widget.video.sources.getPreferredVideoSource() ?? '',
      liveStream: false,
      cacheConfiguration: const BetterPlayerCacheConfiguration(useCache: false),
    );
    final betterPlayerConfiguration = BetterPlayerConfiguration(
      autoDispose: true,
      looping: false,
      placeholderOnTop: false,
      autoPlay: true,
      controlsConfiguration: _createControlsConfiguration(),
      aspectRatio: 16 / 9,
      autoDetectFullscreenAspectRatio: true,
      autoDetectFullscreenDeviceOrientation: true,
      fit: BoxFit.cover,
    );

    setState(() {
      controller = BetterPlayerController(betterPlayerConfiguration);
      controller.setupDataSource(dataSource);
    });

    super.initState();
  }

  BetterPlayerControlsConfiguration _createControlsConfiguration() {
    return BetterPlayerControlsConfiguration(
      enableProgressBar: false,
      enablePlayPause: false,
      playerTheme: BetterPlayerTheme.custom,
      customControlsBuilder: (controller, onPlayerVisibilityChanged) =>
          CustomPlayerControl(
        controller: controller,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BetterPlayer(
      controller: controller,
    );
  }
}

class CustomPlayerControl extends StatefulWidget {
  final BetterPlayerController controller;

  const CustomPlayerControl({
    super.key,
    required this.controller,
  });

  @override
  State<CustomPlayerControl> createState() => _CustomPlayerControlState();
}

class _CustomPlayerControlState extends State<CustomPlayerControl> {
  late FocusNode _inkFocus;

  @override
  void initState() {
    super.initState();
    _inkFocus = FocusNode(
      skipTraversal: true,
    );
    _inkFocus.requestFocus();
  }

  @override
  void dispose() {
    _inkFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            InkWell(
              focusNode: _inkFocus,
              onTap: () => context.read<VideoPlayerCubit>().controlVisibility(),
              child: IgnorePointer(
                ignoring: !state.isVisible,
                child: AnimatedOpacity(
                  opacity: state.isVisible ? 1.0 : 0.0,
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 300),
                  child: PlayerContorls(controller: widget.controller),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class PlayerContorls extends StatefulWidget {
  const PlayerContorls({super.key, required this.controller});

  final BetterPlayerController controller;

  @override
  State<PlayerContorls> createState() => _PlayerContorlsState();
}

class _PlayerContorlsState extends State<PlayerContorls> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoPlayerCubit, VideoPlayerState>(
      listenWhen: (previous, current) =>
          previous.isVisible != current.isVisible,
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            if (state.isVisible) const BlackBackground(),
            Positioned(
              left: 10,
              right: 10,
              bottom: 20,
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
                      focusNode: FocusNode(),
                    ),
                  ),
                  // TODO: handle ndvr when we have data
                  // Flexible(
                  //   flex: 7,
                  //   child: getVodSeekbar(context),
                  // )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _togglePlayPause(BuildContext context) {
    final isPlaying = widget.controller.isPlaying() ?? false;
    isPlaying ? widget.controller.pause() : widget.controller.play();
    setState(() {});
  }

  String _playIcon() {
    if (widget.controller.isPlaying() != null) {
      return widget.controller.isPlaying()!
          ? Assets.videoPause
          : Assets.videoPlay;
    }

    return Assets.videoPause;
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
