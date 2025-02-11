import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/content_cubit/content_cubit.dart';
import 'package:nrbtv/src/core/core.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:ui_kit/ui_kit.dart';

class TvHeroSection extends StatelessWidget {
  const TvHeroSection({
    super.key,
    required this.rootScrollController,
  });

  final ScrollController rootScrollController;

  @override
  Widget build(BuildContext context) {
    return _ImageHero(
      rootScrollController: rootScrollController,
    );
  }
}

class _ImageHero extends StatelessWidget {
  const _ImageHero({
    required this.rootScrollController,
  });

  final ScrollController rootScrollController;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ContentCubit, ContentState, ContentModel?>(
      selector: (state) => state.selectedVideo,
      builder: (context, selectedVideo) {
        return AnimatedSize(
          duration: Durations.long2,
          curve: Curves.easeInOut,
          child: AnimatedSwitcher(
            duration: Durations.long2,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: UiImageBackground(
              key: ValueKey<int>(selectedVideo?.id ?? 0),
              image: selectedVideo?.images.getBanner(),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 60,
                ),
                child: selectedVideo == null
                    ? const SizedBox.shrink()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Focus(
                              focusNode: FocusNode(),
                              child: Text(
                                selectedVideo.title,
                                style: TextStyles.h3.copyWith(
                                    color: context.uiColors.onSecondary),
                              ),
                            ),
                          ),
                          Margins.vertical20,
                          _TagRow(
                            video: selectedVideo,
                          ),
                          Margins.vertical20,
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10,
                                  right: MediaQuery.sizeOf(context).width / 2,
                                  bottom: 10),
                              child: Text(
                                selectedVideo.description ?? '',
                                style: TextStyles.bodySmall
                                    .copyWith(color: context.uiColors.surface),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TagRow extends StatelessWidget {
  const _TagRow({
    required this.video,
  });

  final ContentModel video;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (video.attributes != null)
          TagsWidget(
            isTv: context.isTv,
            attributes: video.attributes!,
          ),
        Margins.vertical16,
      ],
    );
  }
}
