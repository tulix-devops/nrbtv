import 'dart:ui';

import 'package:commons/commons.dart';
import 'package:nrbtv/src/bloc/search_page_filter/search_filter_bloc.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

class ProvidedSearchPage extends StatelessWidget {
  const ProvidedSearchPage({super.key});

  static const path = 'search';
  static const name = 'search';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SearchFilterBloc(
          contentRepository: ContentRepositoryImpl(
            contentRemoteRepository: ContentRemoteDataSource(
              context.read<CustomHTTPClient>(),
            ),
          ),
        );
      },
      child: const SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(_onPageChanged);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onPageChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    if (!mounted) return;
    if (_controller.position.pixels <
        _controller.position.maxScrollExtent * 0.99) return;
    if (_controller.position.pixels <
        _controller.position.maxScrollExtent * 0.99) return;

    final SearchFilterBloc searchBloc = context.read<SearchFilterBloc>();

    if (searchBloc.state.status == Status.loading ||
        !searchBloc.state.hasMorePages) return;
    if (searchBloc.state.status == Status.loading ||
        !searchBloc.state.hasMorePages) return;

    searchBloc.add(const SearchFilterEvent.changePage());
    searchBloc.add(
      const SearchFilterEvent.applyFilter(loadNextPage: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.uiColors.surface,
      body: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: BlocBuilder<SearchFilterBloc, SearchFilterState>(
            builder: (context, state) {
              return CustomScrollView(controller: _controller, slivers: [
                const SliverToBoxAdapter(
                  child: _SearchRow(),
                ),
                switch (state.status) {
                  Status.initial => SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'Search for Content',
                          style: TextStyles.bodyLargeBold.surface(context),
                        ),
                      ),
                    ),
                  Status.failure => SliverErrorWidget(error: state.error),
                  Status.serverFailure => SliverErrorWidget(error: state.error),
                  _ => SliverList.builder(
                      itemCount: state.videos.length,
                      itemBuilder: (context, index) {
                        final ContentModel content = state.videos[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(8),
                            leading: Image.network(
                              content.images.getThumbnail(),
                              width: 100,
                            ),
                            title: Text(
                              content.title,
                            ),
                            titleTextStyle:
                                TextStyles.bodyLargeMedium.surface(context),
                            onTap: () {
                              context.pushNamed(
                                MobileContentDetailPage.name,
                                extra: {'content': content},
                              );
                              // context.read<ContentCubit>().setSelectedVideo(content);
                              // Navigator.of(context).pop();
                            },
                          ),
                        );
                      },
                    ),
                },
                if (state.status == Status.loading && state.videos.isEmpty)
                  const SliverLoadingWidget(),
                if (state.status == Status.loading)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: AppLoadingIndicator(size: 70),
                    ),
                  ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 100),
                ),
              ]);
            },
          ),
        ),
      ),
    );
  }
}

class _SearchRow extends StatefulWidget {
  const _SearchRow({
    super.key,
  });

  @override
  State<_SearchRow> createState() => _SearchRowState();
}

class _SearchRowState extends State<_SearchRow> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'search',
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: context.uiColors.onSurface,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocSelector<SearchFilterBloc, SearchFilterState, String>(
                bloc: context.read<SearchFilterBloc>(),
                selector: (state) {
                  return state.search;
                },
                builder: (context, search) {
                  return Material(
                    color: Colors.transparent,
                    child: AppInput.text(
                      prefixIcon: Assets.searchIcon,
                      isDeviceTv: false,
                      hintText: 'Search',
                      onChanged: (value) {
                        context
                            .read<SearchFilterBloc>()
                            .add(SearchFilterEvent.searchFilterChanged(value));
                      },
                      value: search,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
