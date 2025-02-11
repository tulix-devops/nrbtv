import 'package:commons/commons.dart';
import 'package:nrbtv/src/bloc/content_cubit/content_cubit.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/ui/pages/pages.dart';
import 'package:nrbtv/src/ui/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

class MobileContentPage extends StatefulWidget {
  const MobileContentPage({super.key});

  @override
  State<MobileContentPage> createState() => _MobileContentPageState();
}

class _MobileContentPageState extends State<MobileContentPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    final ContentCubit cubit = context.read<ContentCubit>();
    cubit.getContentList(ContentType.movie.value);
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isBottom = _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent;

        if (isBottom) {
          cubit.nextPage();
          cubit.getContentList(cubit.state.selectedContent.value);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () {
        context.read<ContentCubit>().getContentList(3);
        return Future.value();
      },
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          BackdropAppBar(onPressed: () {
            context.pushNamed(ProvidedSearchPage.path);
          }),
          const _ContentTabs(),
          const SliverToBoxAdapter(
            child: Margins.vertical24,
          ),
          const _ContentBody(),
          BlocSelector<ContentCubit, ContentState, Status>(
            selector: (state) {
              return state.contentStatus;
            },
            builder: (context, state) {
              if (state != Status.success) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: AppLoadingIndicator(
                      size: 60,
                    ),
                  ),
                );
              }
              if (state == Status.success &&
                  context.read<ContentCubit>().state.mainPageContent!.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text('No content found'),
                  ),
                );
              }
              return const SliverToBoxAdapter(
                child: Margins.vertical24,
              );
            },
          ),
          const SliverToBoxAdapter(
            child: Margins.vertical100,
          )
        ],
      ),
    );
  }
}

class _ContentBody extends StatelessWidget {
  const _ContentBody();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: BlocBuilder<ContentCubit, ContentState>(
        builder: (context, state) {
          return SliverList.builder(
              itemCount: state.mainPageContent?.length,
              itemBuilder: (context, index) {
                final ContentModel content = state.mainPageContent![index];
                final String? label = content.attributes?.entries.map((entry) {
                  return '${entry.key}: ${entry.value ?? 'N/A'}';
                }).join(', ');
                return CardItem(
                  image: content.images.getThumbnail(),
                  title: content.title,
                  label: label,
                  onPressed: () {
                    context.pushNamed(MobileContentDetailPage.name,
                        extra: {'content': content});
                  },
                  button: (
                    buttonLabel: 'Play',
                    onPressed: () {
                      context.pushNamed(MobileContentDetailPage.name,
                          extra: {'content': content});
                    },
                    icon: Assets.play
                  ),
                );
              });
        },
      ),
    );
  }
}

class _ContentTabs extends StatefulWidget {
  const _ContentTabs({super.key});

  @override
  State<_ContentTabs> createState() => _ContentTabsState();
}

class _ContentTabsState extends State<_ContentTabs> {
  late Map<String, String> icons = {
    'movie': Assets.videoPlay,
    'channel': Assets.category,
  };

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final tab in ContentType.values)
                if (icons[tab.name] != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: BlocBuilder<ContentCubit, ContentState>(
                      builder: (context, state) {
                        final selectedTab = state.selectedContent.name;

                        return AppChip.mediumPrimaryRounded(
                          prefixIcon: (asset: icons[tab.name]!, size: 24),
                          isOutlined: selectedTab != tab.name,
                          label: tab.name[0].toUpperCase() +
                              tab.name.substring(1, tab.name.length),
                          onPressed: () {
                            if (selectedTab == tab.name) {
                              return;
                            }
                            context
                                .read<ContentCubit>()
                                .updateSelectedContent(tab);
                            context
                                .read<ContentCubit>()
                                .updateSelectedContent(tab);
                            context.read<ContentCubit>()
                              ..reset()
                              ..getContentList(tab.value);
                          },
                        );
                      },
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
