part of 'vod_page.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  static const path = 'video-library/filter';
  static const name = 'video-library/filter';

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<int> _initialCategories = [];
  List<int> _initialCountries = [];

  @override
  void initState() {
    Future.microtask(() {
      _initialCategories = context.read<VodFilterBloc>().state.categoryIds;
      _initialCountries = context.read<VodFilterBloc>().state.countryIds;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasNavbar: false,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                PageHeader(
                  isTv: false,
                  onPressed: () {
                    _onBackPressed();
                  },
                  isMainPage: false,
                  page: 'Sort & Filter',
                ),
                const SliverToBoxAdapter(
                  child: Margins.vertical24,
                ),
                const SliverToBoxAdapter(
                  child: _CategoryFilter(),
                ),
                const SliverToBoxAdapter(
                  child: Margins.vertical24,
                ),
                const SliverToBoxAdapter(
                  child: _CountryFilter(),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 200),
                ),
              ],
            ),
            _FilterActionOverlay(
              initialCategories: _initialCategories,
              initialCountries: _initialCountries,
            ),
          ],
        ),
      ),
    );
  }

  void _onBackPressed() {
    final VodFilterState state = context.read<VodFilterBloc>().state;

    if (!listEquals(_initialCategories, state.categoryIds) ||
        !listEquals(_initialCountries, state.countryIds)) {
      context.read<VodFilterBloc>().add(
            VodFilterEvent.undoFilter(
              initialCategories: _initialCategories,
              initialCountries: _initialCountries,
            ),
          );
    }

    context.read<AppCubit>().showOverlay();

    Future.delayed(const Duration(milliseconds: 300), () {
      context.read<AppCubit>().hideOverlay();
      context.pop();
    });
  }
}

class _CategoryFilter extends StatelessWidget {
  const _CategoryFilter();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VodCubit, VodState, List<CategoryModel>>(
      selector: (state) {
        return state.categories;
      },
      builder: (context, categories) {
        return _FilterWidget(
          filterTitle: 'Categories',
          children: [
            for (final category in categories) _GenreFilterButton(category),
          ],
        );
      },
    );
  }
}

class _CountryFilter extends StatelessWidget {
  const _CountryFilter();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VodCubit, VodState, List<CountryModel>>(
      selector: (state) {
        return state.countries;
      },
      builder: (context, categories) {
        return _FilterWidget(
          filterTitle: 'Countries',
          children: [
            for (final category in categories) _CountryFilterButton(category),
          ],
        );
      },
    );
  }
}

class _FilterWidget extends StatelessWidget {
  const _FilterWidget({
    required this.filterTitle,
    required this.children,
  });

  final String filterTitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            filterTitle,
            style: TextStyles.h5.surface(context),
          ),
          Margins.vertical24,
          Wrap(
            direction: Axis.horizontal,
            spacing: 12,
            runSpacing: 24,
            children: children,
          ),
          Margins.vertical24
        ],
      ),
    );
  }
}

class _CountryFilterButton extends StatelessWidget {
  const _CountryFilterButton(
    this.category,
  );

  final CountryModel category;

  @override
  Widget build(BuildContext context) {
    return AppChip.smallPrimaryRounded(
      label: category.name,
      onPressed: () {
        context.read<VodFilterBloc>().add(
              VodFilterEvent.countryFilterChanged(category.id),
            );
      },
      isOutlined: context.select<VodFilterBloc, bool>(
        (c) => !c.state.isCountryFilterActive(category.id),
      ),
    );
  }
}

class _GenreFilterButton extends StatelessWidget {
  const _GenreFilterButton(
    this.category,
  );

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return AppChip.smallPrimaryRounded(
      label: category.title,
      onPressed: () {
        context.read<VodFilterBloc>().add(
              VodFilterEvent.categoryFilterChanged(category.id),
            );
      },
      isOutlined: context.select<VodFilterBloc, bool>(
        (c) => !c.state.isCategoryFilterActive(category.id),
      ),
    );
  }
}

class _FilterActionOverlay extends StatefulWidget {
  const _FilterActionOverlay({
    required this.initialCategories,
    required this.initialCountries,
  });

  final List<int> initialCategories;
  final List<int> initialCountries;

  @override
  State<_FilterActionOverlay> createState() => _FilterActionOverlayState();
}

class _FilterActionOverlayState extends State<_FilterActionOverlay> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.only(top: 1),
        decoration: _getDecoration(AppColors.dark3),
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 36),
          decoration: _getDecoration(context.uiColors.surface),
          // TODO: implement filter actions
          child: Row(
            children: [
              Expanded(
                child: AppButton.secondaryRounded(
                  label: 'Reset',
                  textColor: context.uiColors.onSurface,
                  onPressed: () {
                    context.read<VodFilterBloc>().add(
                          const VodFilterEvent.resetFilter(),
                        );

                    context.pop();
                  },
                ),
              ),
              Margins.horizontal12,
              Expanded(
                child: AppButton.primaryRounded(
                  label: 'Apply',
                  isDisabled: context.select<VodFilterBloc, bool>((c) {
                    return listEquals(
                            widget.initialCategories, c.state.categoryIds) &&
                        listEquals(widget.initialCountries, c.state.countryIds);
                  }),
                  onPressed: () {
                    context
                        .read<VodFilterBloc>()
                        .add(const VodFilterEvent.applyFilter());
                    context.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _getDecoration(Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    );
  }
}
