import 'package:app_focus/app_focus.dart';
import 'package:commons/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/bloc.dart';
import 'package:nrbtv/src/data/data.dart';
import 'package:nrbtv/src/ui/pages/live/live_tv_detail_page.dart';
import 'package:ui_kit/widgets/live/ui_live_channel_card.dart';

class ChannelListWidget extends StatefulWidget {
  const ChannelListWidget({
    super.key,
    required this.controller,
    required this.channels,
    this.viewPortFraction,
  });

  final VerticalPageViewController controller;
  final List<ChannelModel> channels;
  final double? viewPortFraction;

  @override
  State<ChannelListWidget> createState() => _ChannelListWidgetState();
}

class _ChannelListWidgetState extends State<ChannelListWidget> {
  @override
  Widget build(BuildContext context) {
    return PageViewFocus(
      viewPortFraction: widget.viewPortFraction ?? 0.42,
      onFocusChange: (value, controller) {
        setState(() {
          if (!value) return;

          controller.onFocusReceived();
        });
      },
      focusNode: widget.controller.primaryFocusNode,
      pageCount: widget.channels.length,
      onEnterPressed: (currentPageIndex, controller) {
        final ChannelModel channel = widget.channels[currentPageIndex];

        _onPressed(context, channel);
      },
      builder: (context, controller, itemIndex, currentPageIndex) {
        final ChannelModel channel =
            widget.channels[controller.getItemIndex(itemIndex)];

        return UiLiveChannelCard(
          key: ValueKey<String>(channel.id.toString()),
          channelTitle: channel.title,
          channelThumb: channel.banner,
          isSelected: widget.controller.primaryFocusNode.hasFocus &&
              controller.index.value == itemIndex,
          isLive: channel.statusId == 1,
          onPressed: () {
            _onPressed(context, channel);
          },
        );
      },
    );
  }

  void _onPressed(BuildContext context, ChannelModel channel) {
    context.read<ChannelCubit>().selectChannel(channel);

    ///TODO this extra
    context.pushNamed(LiveTvDetailPage.name, extra: {});
  }
}
