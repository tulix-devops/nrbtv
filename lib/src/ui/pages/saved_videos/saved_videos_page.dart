import 'package:commons/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/index.dart';

import 'package:ui_kit/ui_kit.dart';

class SavedVideosPage extends StatelessWidget {
  const SavedVideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () {
        context.read<SavedVideosCubit>().getSavedVideos();
        return Future.value();
      },
      child: BlocBuilder<SavedVideosCubit, SavedVideosState>(
        key: key,
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return AppStatusWidget(
            status: state.status,
            loaderWidget: const Center(
              child: AppLoadingIndicator(size: 70),
            ),
            errorWidget: Center(
              child: Text(state.error ?? 'An error occurred'),
            ),
            widget: const Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 12),
              child: _GridView(),
            ),
          );
        },
      ),
    );
  }
}

class _GridView extends StatelessWidget {
  const _GridView();

  @override
  Widget build(BuildContext context) {
    final List<VodModel> videos =
        context.select<SavedVideosCubit, List<VodModel>>((c) => c.state.videos);

    return CustomScrollView(
      slivers: [
        PageHeader(
          isTv: context.isTv,
          onPressed: () {},
          isMainPage: true,
          page: 'Saved',
          titlePadding: const EdgeInsets.only(top: 15),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        videos.isEmpty
            ? const SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 70),
                  child: _EmptyList(),
                ),
              )
            : SliverToBoxAdapter(
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    for (final video in videos)
                      SizedBox(
                        width: !context.isTv
                            ? MediaQuery.sizeOf(context).width / 2 - 24
                            : null,
                        child: AppCard(
                          onTap: () {
                            _onPressed(context, video);
                          },
                          content: Text(
                            video.title,
                            style: TextStyles.bodyLargeBold.white,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          image: video.storage?.record.thumb ?? "",
                        ),
                      ),
                  ],
                ),
              ),
        if (videos.isNotEmpty)
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
      ],
    );
  }

  void _onPressed(BuildContext context, VodModel video) {
    final bool isTv = context.isTv;

    final String page =
        isTv ? VodTvDetailsPage.name : MobileContentDetailPage.name;

    context.pushNamed(
      page,

      ///TODO
      extra: {'vodCubit': context.read<VodCubit>(), 'vodEntity': video},
    );
  }
}

// ignore: unused_element
class _EmptyList extends StatelessWidget {
  const _EmptyList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AppIcon(Assets.listEmptyDark),
        Margins.vertical10,
        Align(
          alignment: Alignment.center,
          child: AppText(
            text: 'You don\'t have saved items',
            gradient: context.uiColors.primaryGradient,
            style: TextStyles.h4,
          ),
        ),
        Margins.vertical10,
        Text(
          'It seems that you haven\'t added any item to the saved list',
          style: TextStyles.bodyXLarge.surface(context),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
