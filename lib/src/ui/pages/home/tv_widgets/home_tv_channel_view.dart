import 'package:app_focus/app_focus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ui_kit/ui_kit.dart';
import 'package:nrbtv/src/index.dart';

class HomeTvChannelView extends StatelessWidget {
  const HomeTvChannelView({
    super.key,
    required this.controller,
  });

  final VerticalPageViewController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChannelCubit, ChannelState>(
      builder: (context, state) {
        return AppStatusWidget(
          status: state.status,
          loaderWidget: const AppLoadingIndicator(size: 70),
          errorWidget: Center(
            child: Text(state.error ?? 'An error occurred'),
          ),
          widget: _ChannelListView(
            controller: controller,
          ),
        );
      },
    );
  }
}

class _ChannelListView extends StatefulWidget {
  const _ChannelListView({
    required this.controller,
  });

  final VerticalPageViewController controller;

  @override
  State<_ChannelListView> createState() => _ChannelListViewState();
}

class _ChannelListViewState extends State<_ChannelListView> {
  @override
  void initState() {
    Future.microtask(() {
      if (!mounted) return;

      widget.controller.primaryFocusNode.requestFocus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChannelModel> channels = context
        .select<ChannelCubit, List<ChannelModel>>((c) => c.state.channels);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const UiTvListHeader(
          headerTitle: 'Live Channels',
        ),
        ChannelListWidget(
          controller: widget.controller,
          channels: channels,
        )
      ],
    );
  }
}
