import 'package:app_focus/widgets/page_view_focus.dart';
import 'package:commons/commons.dart';
import 'package:nrbtv/src/bloc/content_cubit/content_cubit.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/widgets/live/ui_live_channel_card.dart';

class LiveTvPageView extends StatefulWidget {
  const LiveTvPageView({
    super.key,
    required this.content,
    required this.focusNode,
  });

  final List<ContentModel> content;
  final FocusNode focusNode;
  @override
  State<LiveTvPageView> createState() => LiveTvPageViewState();
}

class LiveTvPageViewState extends State<LiveTvPageView> {
  void _onCardPressed(BuildContext context, ContentModel content) {
    context.pushNamed(
      VideoPlayerPage.name,
      extra: {'contentModel': content, 'isTrailer': false},
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageViewFocus(
      infinityCarousel: false,
      viewPortFraction: 0.3,
      onPageChanged: (activeIndex) {
        if (activeIndex >= 0 && activeIndex < widget.content.length) {
          context.read<ContentCubit>().setSelectedContent(
                widget.content[activeIndex],
              );
        }
      },
      onFocusChange: (value, controller) {
        setState(() {
          if (!value) return;

          controller.onFocusReceived();
        });
      },
      focusNode: widget.focusNode,
      pageCount: widget.content.length,
      onEnterPressed: (activeIndex, controller) {
        _onCardPressed(context, widget.content[activeIndex]);
      },
      builder: (context, controller, itemIndex, currentPageIndex) {
        final bool isSelected =
            widget.focusNode.hasFocus && controller.index.value == itemIndex;

        final ContentModel channel =
            widget.content[controller.getItemIndex(itemIndex)];

        return UiLiveChannelCard(
          channelThumb: channel.images.getPoster(),
          channelTitle: channel.title,
          isLive: true,
          isSelected: isSelected,
        );
      },
    );
  }
}
