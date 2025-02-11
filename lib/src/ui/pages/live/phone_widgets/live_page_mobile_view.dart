import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ui_kit/ui_kit.dart';
import 'package:nrbtv/src/index.dart';

class LivePageMobileView extends StatelessWidget {
  const LivePageMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () {
        context.read<ChannelCubit>().init();

        return Future.value();
      },
      child: CustomScrollView(
        slivers: [
          PageHeader(
            isTv: context.isTv,
            onPressed: () {},
            isMainPage: true,
            page: 'Live Channels',
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            sliver: BlocBuilder<ChannelCubit, ChannelState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status || current.status.isSuccess,
              builder: (context, state) {
                return AppStatusWidget(
                  status: state.status,
                  loaderWidget: const SliverLoadingWidget(),
                  errorWidget: const SliverErrorWidget(),
                  widget: _GridView(channels: state.channels),
                );
              },
            ),
          ),
          const SliverToBoxAdapter(child: Margins.vertical16),
        ],
      ),
    );
  }
}

class _GridView extends StatelessWidget {
  const _GridView({required this.channels});

  final List<ChannelModel> channels;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: channels.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: (MediaQuery.sizeOf(context).width / 2) / 120,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          final ChannelModel channel = channels[index];

          return GestureDetector(
            onTap: () {
              context.pushNamed(LiveDetailPage.name, extra: {});
            },
            child: Container(
              decoration: channel.banner.isEmpty
                  ? null
                  : BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          // channel.storage.record.thumb!,
                          channel.banner,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
              child: const Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: RatingWidget(title: 'LIVE'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
