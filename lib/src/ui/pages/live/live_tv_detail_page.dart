import 'package:app_focus/app_focus.dart';
import 'package:commons/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nrbtv/src/index.dart';
import 'package:ui_kit/ui_kit.dart';

class LiveTvDetailPage extends StatefulWidget {
  const LiveTvDetailPage({super.key});

  static const path = 'live-detail-screen';
  static const name = 'live-detail-screen';

  @override
  State<LiveTvDetailPage> createState() => _LiveTvDetailPageState();
}

class _LiveTvDetailPageState extends State<LiveTvDetailPage> {
  final ScrollController _controller = ScrollController();

  final VerticalPageViewController _similarChannelController =
      VerticalPageViewController(
    pageCount: 1,
    primaryFocusNode: FocusNode(),
  );

  bool relatedChannelsVisible = false;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void setRelatedChannelVisibility(bool value) {
    setState(() {
      relatedChannelsVisible = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ChannelModel? channel = context
        .select<ChannelCubit, ChannelModel?>((c) => c.state.selectedChannel);

    if (channel == null) {
      return const SizedBox.shrink();
    }

    return AppScaffold(
      hasNavbar: false,
      body: UiImageBackground(
        // image: channel.storage.record.thumb ?? "",
        image: channel.banner,
        child: CustomScrollView(
          controller: _controller,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 25),
                child: _Content(
                  onShowMorePressed: setRelatedChannelVisibility,
                  scrollController: _controller,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: AnimatedSwitcher(
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 200),
                  child: relatedChannelsVisible
                      ? BlocSelector<ChannelCubit, ChannelState,
                          List<ChannelModel>>(
                          selector: (state) {
                            return state.relatedChannels(channel);
                          },
                          builder: (context, relatedChannels) {
                            return ChannelListWidget(
                              channels: relatedChannels,
                              controller: _similarChannelController,
                              viewPortFraction: 0.36,
                              key: const ValueKey<String>('content-list'),
                            );
                          },
                        )
                      : const SizedBox.shrink(
                          key: ValueKey<String>('empty-list'),
                        )),
            ),
          ],
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.scrollController,
    required this.onShowMorePressed,
  });
  final ScrollController scrollController;
  final void Function(bool) onShowMorePressed;

  @override
  Widget build(BuildContext context) {
    final ChannelModel? channel = context
        .select<ChannelCubit, ChannelModel?>((c) => c.state.selectedChannel);

    if (channel == null) {
      return const SizedBox.shrink();
    }

    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double rightPadding = screenWidth * 0.4;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            channel.title,
            style: TextStyles.h1.white,
          ),
        ),
        Margins.vertical20,
        Padding(
          padding: EdgeInsets.only(left: 10, right: rightPadding),
          child: Text(
            channel.description,
            style: TextStyles.bodyLarge,
          ),
        ),
        Margins.vertical20,
        _ButtonList(
          channel: channel,
          controller: scrollController,
          onShowMorePressed: onShowMorePressed,
        ),
      ],
    );
  }
}

class _ButtonList extends StatefulWidget {
  const _ButtonList({
    required this.channel,
    required this.controller,
    required this.onShowMorePressed,
  });

  final void Function(bool isMoreSelected) onShowMorePressed;
  final ChannelModel channel;
  final ScrollController controller;

  @override
  State<_ButtonList> createState() => _ButtonListState();
}

class _ButtonListState extends State<_ButtonList> {
  bool isMoreSelected = false;

  late final List<FocusNode> _focusNodes;

  late final List<
      ({
        String label,
        void Function(BuildContext context) onPressed,
        String icon,
      })> _buttonList = [
    (
      icon: Assets.play,
      label: 'Play',
      onPressed: (_) {
        // if (!context.read<AppCubit>().state.isAuthenticated) {
        //   context.read<AppCubit>().showAuthDialog();
        //   return;
        // }

        // if (!context.read<AppCubit>().state.isSubscribed) {
        //   context.pushNamed(SubscribePage.name);
        //   return;
        // }

        context.pushNamed(VideoPlayerPage.name, extra: {
          "mediaEntity": MediaModel.channel(widget.channel),
          "isTrailer": false
        });
      }
    ),
    (
      icon: Assets.moreCircles,
      label: 'Similar Channels',
      onPressed: (BuildContext context) {
        const int scrollValue = 250;

        setState(() {
          isMoreSelected = !isMoreSelected;
        });

        widget.onShowMorePressed(isMoreSelected);
        widget.controller.animateTo(
          isMoreSelected
              ? widget.controller.offset + scrollValue
              : widget.controller.offset - scrollValue,
          duration: Durations.long2,
          curve: Curves.easeInOut,
        );
      }
    ),
  ];

  @override
  void initState() {
    _focusNodes = List.generate(_buttonList.length, (_) => FocusNode());
    Future.microtask(() => _focusNodes.first.requestFocus());

    super.initState();
  }

  @override
  void dispose() {
    _focusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ({Color defaultColor, Color focusedColor}) getColor =
        (defaultColor: Colors.white, focusedColor: context.uiColors.primary);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Margins.vertical40,
        for (final (index, button) in _buttonList.indexed)
          FocusTextButton(
            labelColor: getColor,
            iconColor: getColor,
            useDefaultButtonStyle: true,
            focusNode: _focusNodes[index],
            icon: button.icon,
            onPressed: button.onPressed,
            label: button.label,
          ),
      ],
    );
  }
}
