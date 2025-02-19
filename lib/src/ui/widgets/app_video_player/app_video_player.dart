import 'dart:async';

import 'package:commons/commons.dart';
import 'package:commons/shared/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/bloc.dart';
import 'package:nrbtv/src/data/models/content/tv_schedule_model.dart';
import 'package:river_player/river_player.dart';
import 'package:nrbtv/src/core/core.dart';

import 'package:ui_kit/ui_kit.dart';
import 'package:nrbtv/src/ui/widgets/app_video_player/screens/live_fullscreen.dart';
import 'package:nrbtv/src/ui/widgets/app_video_player/screens/vod_fullscreen.dart';

part 'video_button.dart';
part 'video_controls.dart';
part 'video_layouts.dart';
part 'video_seekbar.dart';
part 'volume_slider.dart';

class AppVideoPlayer extends StatefulWidget {
  const AppVideoPlayer({
    super.key,
    required this.image,
    required this.link,
    required this.video,
  });

  final String image;
  final String link;
  final TvScheduleModel video;

  @override
  State<AppVideoPlayer> createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  BetterPlayerController? _betterPlayerController;
  final StreamController<bool> _placeholderStreamController =
      StreamController.broadcast();
  bool _hasLoggedAdView = false;
  bool showAdDevelopment = false;
  late bool showAd;
  @override
  void initState() {
    final cubit = context.read<VideoPlayerCubit>();
    cubit.reset();
    cubit.setVideo(widget.video);
    _initializeAdAndPlayer();
    super.initState();
  }

  Future<void> _initializeAdAndPlayer() async {
    final cubit = context.read<VideoPlayerCubit>();
    await cubit.checkAdStatus();
    showAd = _shouldShowAd(cubit) && showAdDevelopment;

    if (showAd && showAdDevelopment) {
      cubit.updateAdStatus(
          (contentId: widget.video.id, eventTypeId: AdStatus.initial.value));
    }
    _initializePlayer();
  }

  bool _shouldShowAd(VideoPlayerCubit cubit) {
    if (cubit.state.adModel == null || cubit.state.adModel?.ad.vast == null) {
      return false;
    }
    return cubit.state.adModel!.showAd;
  }

  void _initializePlayer() {
    final VideoPlayerCubit cubit = context.read<VideoPlayerCubit>();
    final betterPlayerConfiguration = BetterPlayerConfiguration(
      autoDispose: true,
      looping: false,
      placeholderOnTop: false,
      autoPlay: true,
      aspectRatio: 16 / 9,
      autoDetectFullscreenAspectRatio: true,
      autoDetectFullscreenDeviceOrientation: true,
      controlsConfiguration: _createControlsConfiguration(),
      fit: BoxFit.cover,
      placeholder: _PlaceHolder(placeHolder: _placeholderStreamController),
    );

    final dataSource = BetterPlayerDataSource.network(
      showAd ? cubit.state.adModel!.ad.vast! : widget.link,
      liveStream: widget.video.id == 21,
      cacheConfiguration: const BetterPlayerCacheConfiguration(useCache: false),
    );

    setState(() {
      _betterPlayerController =
          BetterPlayerController(betterPlayerConfiguration);
      _betterPlayerController!.setupDataSource(dataSource);
    });

    _setTvFullScreen();
    _addPlayerEventListeners();
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

  void _addPlayerEventListeners() {
    final VideoPlayerCubit cubit = context.read<VideoPlayerCubit>();
    _betterPlayerController?.addEventsListener((event) {
      switch (event.betterPlayerEventType) {
        case BetterPlayerEventType.progress:
          if (showAd && !_hasLoggedAdView) {
            _hasLoggedAdView = true;
            cubit.updateAdStatus(
                (contentId: widget.video.id, eventTypeId: AdStatus.view.value));
          }
          break;
        case BetterPlayerEventType.finished:
          if (showAd && !context.read<VideoPlayerCubit>().state.isAdDone) {
            cubit.updateAdStatus((
              contentId: widget.video.id,
              eventTypeId: AdStatus.finish.value
            ));
            _handleVideoFinished();
          }
          break;
        case BetterPlayerEventType.play:
          _setPlaceholderVisibleState(false);
          break;
        default:
          _handleBuffering();
      }
    });
  }

  void _handleVideoFinished() {
    context.read<VideoPlayerCubit>().setAdDone();
    final BetterPlayerDataSource dataSource = BetterPlayerDataSource.network(
      widget.link,
      cacheConfiguration: const BetterPlayerCacheConfiguration(useCache: false),
    );
    _betterPlayerController?.setupDataSource(dataSource);
  }

  void _handleBuffering() {
    final bool? isBuffering = _betterPlayerController?.isBuffering();

    if (isBuffering != null) {
      _setPlaceholderVisibleState(isBuffering);
    }
  }

  void _setPlaceholderVisibleState(bool visible) {
    _placeholderStreamController.add(visible);
  }

  void _setTvFullScreen() {
    if (context.isTv) {
      context.read<VideoPlayerCubit>().setFullScreen();
    }
  }

  @override
  void dispose() {
    _placeholderStreamController.close();
    _betterPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_betterPlayerController == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return PopScope(
      canPop: !_betterPlayerController!.isFullScreen,
      onPopInvokedWithResult: (res, _) async {
        if (_betterPlayerController!.isFullScreen) {
          context.read<VideoPlayerCubit>().setFullScreen(isFullScreen: false);
        }
      },
      child: BetterPlayer(controller: _betterPlayerController!),
    );
  }
}

class _PlaceHolder extends StatelessWidget {
  const _PlaceHolder({required this.placeHolder});
  final StreamController<bool> placeHolder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: placeHolder.stream,
      builder: (context, snapshot) {
        bool showPlaceholder = snapshot.data ?? false;
        return showPlaceholder
            ? Center(
                child: CircularProgressIndicator(
                  color: context.uiColors.primary,
                ),
              )
            : const SizedBox.shrink();
      },
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
      onKeyEvent: (node, event) {
        if (event.logicalKey == LogicalKeyboardKey.goBack) {
          Future.delayed(const Duration(milliseconds: 200), () {
            context.read<VideoPlayerCubit>().handleVisibility();
          });

          return KeyEventResult.handled;
        }

        return KeyEventResult.ignored;
      },
    );
    _inkFocus.requestFocus();
  }

  @override
  void dispose() {
    _inkFocus.dispose();
    super.dispose();
  }

  bool showAd = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (!state.isAdDone && showAd) {
          return Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 15,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: VideoSeekbar(
                    controller: widget.controller,
                    isEnabled: false,
                  ),
                ),
              ),
            ],
          );
        }
        return Stack(
          alignment: Alignment.center,
          children: [
            // if (state.video != null &&
            //     state.video!.typeId == ContentType.movie.value)
            //   Positioned(
            //     child: Image.network(
            //       state.video!.images.getThumbnail(),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            InkWell(
              focusNode: _inkFocus,
              onTap: () => context.read<VideoPlayerCubit>().controlVisibility(),
              child: IgnorePointer(
                ignoring: !state.isVisible,
                child: AnimatedOpacity(
                  opacity: state.isVisible ? 1.0 : 0.0,
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 300),
                  child: widget.controller.isLiveStream()
                      ? LiveFullscreen(controller: widget.controller)
                      : VodFullScreen(controller: widget.controller),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
