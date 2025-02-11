import 'package:commons/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/search_page_filter/search_filter_bloc.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/index.dart';
import 'package:nrbtv/src/ui/pages/content_detail/content_detail_page.dart';
import 'package:nrbtv/src/ui/pages/tv_search/tv_search_input_page.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:nrbtv/src/ui/widgets/movie_item_builder.dart';

class TvSearchPage extends StatefulWidget {
  const TvSearchPage({super.key});

  @override
  State<TvSearchPage> createState() => _TvSearchPageState();
}

class _TvSearchPageState extends State<TvSearchPage> {
  final TextEditingController textController = TextEditingController();

  late ScrollController _scrollController;
  bool isLoading = false;

  @override
  void initState() {
    _scrollController = ScrollController();

    _scrollController.addListener(
      () async {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          isLoading = !isLoading;
          // context.read<VodFilterBloc>().add(VodFilterEvent.pagination(page));
        }
      },
    );

    super.initState();
  }

  void _onTap(ContentModel content) {
    context.pushNamed(
      ContentDetailPage.name,
      extra: {
        'content': content,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isVideosEmpty = context.select<SearchFilterBloc, bool>(
        (value) => value.state.videos.isNotEmpty);
    final bool hasMorePages = context
        .select<SearchFilterBloc, bool>((value) => value.state.hasMorePages);
    final bool isMoreThanSeven = context.select<SearchFilterBloc, int>(
            (value) => value.state.videos.length) >
        7;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomScrollView(controller: _scrollController, slivers: [
          const SliverToBoxAdapter(
            child: Margins.vertical24,
          ),
          const SliverAppBar(
            floating: true,
            backgroundColor: Colors.transparent,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: _SearchInput(),
                ),
                Margins.horizontal12,
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: Margins.vertical16,
          ),
          BlocSelector<SearchFilterBloc, SearchFilterState, List<ContentModel>>(
            selector: (state) {
              return state.videos;
            },
            builder: (context, data) {
              return SliverGrid.builder(
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent:
                        (MediaQuery.sizeOf(context).width / 6) - 10,
                    mainAxisSpacing: 0,
                    childAspectRatio: 16 / 9,
                    mainAxisExtent:
                        (MediaQuery.sizeOf(context).height / 3) + 30,
                    crossAxisSpacing: 0),
                itemBuilder: (context, index) {
                  return MovieItemBuilder(
                    callback: () {
                      _onTap(data[index]);
                    },
                    video: data[index],
                  );
                },
              );
            },
          ),
          if (context
              .select<SearchFilterBloc, bool>((c) => c.state.isLoadingNextPage))
            const SliverToBoxAdapter(
                child: Column(
              children: [
                AppLoadingIndicator(size: 50),
                SizedBox(
                  height: 20,
                )
              ],
            )),
          if (isVideosEmpty && hasMorePages && isMoreThanSeven)
            SliverToBoxAdapter(
                child: AppButton.primary(
                    label: 'Load More',
                    onPressed: () {
                      context
                          .read<SearchFilterBloc>()
                          .add(const SearchFilterEvent.changePage());
                      context.read<SearchFilterBloc>().add(
                          const SearchFilterEvent.applyFilter(
                              loadNextPage: true));
                    })),
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ]),
      ),
    );
  }
}

class _SearchInput extends StatefulWidget {
  const _SearchInput({
    super.key,
  });

  @override
  State<_SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<_SearchInput> {
  late final FocusNode _inputToFocus = FocusNode();
  bool canNavigate = false;

  @override
  void initState() {
    super.initState();
    _inputToFocus.requestFocus();
    _inputToFocus.addListener(_onFocusChange);
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        canNavigate = true;
      });
    });
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _inputToFocus.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String searchValue =
        context.select<SearchFilterBloc, String>((value) => value.state.search);

    return Focus(
      focusNode: _inputToFocus,
      onFocusChange: (hasFocus) {
        if (hasFocus != _inputToFocus.hasFocus) {
          setState(() {});
        }
      },
      onKeyEvent: (node, e) {
        if (e.logicalKey == LogicalKeyboardKey.select && canNavigate) {
          _inputToFocus.unfocus();

          context.pushNamed(
            TvSearchInputPage.path,
            extra: {
              'searchFilterBloc': context.read<SearchFilterBloc>(),
            },
          );
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: AppInput.none(
        isDeviceTv: context.isTv,
        isFocused: _inputToFocus.hasFocus,
        onFieldSubmitted: (_) {},
        value: searchValue,
        prefixIcon: Assets.searchIcon,
        hintText: 'Search',
        onChanged: (value) {
          context.read<SearchFilterBloc>().add(
                SearchFilterEvent.searchFilterChanged(searchValue),
              );
        },
      ),
    );
  }
}
