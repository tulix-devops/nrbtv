import 'package:commons/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/index.dart';
import 'package:nrbtv/src/ui/pages/vod/phone_widgets/widgets.dart';
import 'package:ui_kit/ui_kit.dart';

class VodMobileView extends StatefulWidget {
  const VodMobileView({super.key});

  @override
  State<VodMobileView> createState() => VodMobileViewState();
}

class VodMobileViewState extends State<VodMobileView> {
  late ScrollController _scrollController;

  // int page = 1;

  // @override
  // void initState() {
  //   _scrollController = ScrollController();
  //   _scrollController.addListener(
  //     () async {
  //       final VodFilterBloc bloc = context.read<VodFilterBloc>();
  //       if (_scrollController.position.maxScrollExtent ==
  //               _scrollController.position.pixels &&
  //           !bloc.state.isLoadingNextPage) {
  //         context.read<VodFilterBloc>().add(const VodFilterEvent.changePage());
  //         context
  //             .read<VodFilterBloc>()
  //             .add(const VodFilterEvent.applyFilter(loadNextPage: true));
  //       }
  //     },
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: RefreshIndicator.adaptive(
          onRefresh: () {
            context.read<VodCubit>().fetchHomeList();
            return Future.value();
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              const SliverToBoxAdapter(
                child: Margins.vertical24,
              ),
              const SliverAppBar(
                title: VodMobileSearchSection(),
                floating: true,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
              ),
              const SliverToBoxAdapter(
                child: _ActiveFilterChips(),
              ),
              BlocBuilder<VodFilterBloc, VodFilterState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  return AppStatusWidget(
                    status: state.status,
                    loaderWidget: const SliverLoadingWidget(),
                    errorWidget: const SliverErrorWidget(),
                    widget: const _VodBody(),
                  );
                },
              ),
              const SliverToBoxAdapter(
                child: Margins.vertical24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _VodBody extends StatefulWidget {
  const _VodBody();

  @override
  State<_VodBody> createState() => _VodBodyState();
}

class _VodBodyState extends State<_VodBody> {
  @override
  Widget build(BuildContext context) {
    final List<VodModel> data = context.select<VodFilterBloc, List<VodModel>>(
      (c) => c.state.videos,
    );

    return data.isEmpty
        ? const _NotFoundWidget()
        : BlocSelector<VodFilterBloc, VodFilterState, bool>(
            selector: (state) {
              return state.isLoadingNextPage;
            },
            builder: (context, isLoading) {
              return SliverList.builder(
                itemCount: data.length + 1,
                itemBuilder: (context, index) {
                  if (isLoading && index == data.length) {
                    return const AppLoadingIndicator(size: 50);
                  }

                  if (index == data.length) {
                    return const SizedBox(height: 50);
                  }

                  final VodModel video = data[index];

                  return _VideoItem(
                    video: video,
                  );
                },
              );
            },
          );
  }
}

class _VideoItem extends StatelessWidget {
  const _VideoItem({
    required this.video,
  });

  final VodModel video;

  @override
  Widget build(BuildContext context) {
    final SavedButtonModel buttonModel = SavedButtonUtil.getModel(
      context.select<VodCubit, bool>((c) {
        return c.state.savedVideos.contains(video.id);
      }),
    );

    return CardItem(
      button: (buttonLabel: '', onPressed: () {}, icon: buttonModel.icon),
      image: video.storage?.record.thumb ?? "",
      title: video.title,
      label: '${video.productionYear}',
      subLabel: video.categories.map((e) => e.title).join(', '),
      // buttonLabel: buttonModel.label,
      isOutlined: buttonModel.isOutlined,
      onPressed: () {
        context.pushNamed(
          MobileContentDetailPage.name,
          extra: {
            'vodCubit': context.read<VodCubit>(),
            'vodEntity': video,
          },
        );
      },
    );
  }
}

class _NotFoundWidget extends StatelessWidget {
  const _NotFoundWidget();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const AppIcon(
            Assets.notFound404,
          ),
          Margins.vertical30,
          Text(
            'Not found',
            style: TextStyles.h4.primary(context),
          ),
          Margins.vertical30,
          Text(
            'Sorry, the keyword you entered could not be found. Try to check again or search with other keywords.',
            textAlign: TextAlign.center,
            style: TextStyles.bodyXLargeMedium.surface(context),
          ),
          Margins.vertical24
        ],
      ),
    );
  }
}

class _ActiveFilterChips extends StatelessWidget {
  const _ActiveFilterChips();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VodFilterBloc, VodFilterState>(
      buildWhen: (previous, current) {
        return previous.categoryIds != current.categoryIds ||
            previous.countryIds != current.countryIds ||
            previous.releaseYears != current.releaseYears;
      },
      builder: (context, state) {
        final List<String> filters = _mapActiveFilters(context, state);

        if (filters.isEmpty) {
          return Margins.vertical24;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final filter in filters)
                AppChip.smallPrimaryRounded(
                  label: filter,
                  onPressed: () {
                    _onFilterRemoved(context, filter);
                  },
                  isOutlined: true,
                  suffixIcon: (
                    asset: Assets.deleteFilter,
                    size: 16,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _onFilterRemoved(BuildContext context, String filter) {
    final VodState vodState = context.read<VodCubit>().state;

    context.read<VodFilterBloc>().add(
          VodFilterEvent.filterRemoved(
            filter,
            categories: vodState.categories,
            countries: vodState.countries,
          ),
        );
  }

  List<String> _mapActiveFilters(BuildContext context, VodFilterState state) {
    final VodState vodState = context.read<VodCubit>().state;

    return state.mapActiveFilters(vodState.categories, vodState.countries);
  }
}
