part of 'vod_filter_bloc.dart';

@freezed
class VodFilterState with _$VodFilterState {
  const VodFilterState._();

  const factory VodFilterState({
    @Default(<int>[]) List<int> categoryIds,
    @Default(<int>[]) List<int> countryIds,
    @Default(<int>[]) List<int> releaseYears,
    @Default('') String search,
    @Default(Status.initial) Status status,
    @Default([]) List<VodModel> videos,
    @Default([]) List<VodModel> savedVideos,
    @Default(1) int page,
    @Default(false) bool hasMorePages,
    String? error,
  }) = _VodFilterState;

  List<String> mapActiveFilters(List<CategoryModel> categoryEntities,
      List<CountryModel> countryEntities) {
    final Iterable<String> categories = categoryEntities
        .where((e) => categoryIds.contains(e.id))
        .map((e) => e.title);

    final Iterable<String> countries = countryEntities
        .where(
          (e) => countryIds.contains(e.id),
        )
        .map((e) => e.name);

    final List<int> years = releaseYears;

    return [...categories, ...countries, ...years.map((e) => '$e')];
  }

  bool get isLoadingNextPage {
    return status == Status.loadingNextPage;
  }

  bool isCategoryFilterActive(int id) {
    return categoryIds.contains(id);
  }

  bool isCountryFilterActive(int id) {
    return countryIds.contains(id);
  }

  bool isYearFilterActive(int year) {
    return releaseYears.contains(year);
  }

  bool get isFilterActive {
    return categoryIds.isNotEmpty ||
        countryIds.isNotEmpty ||
        releaseYears.isNotEmpty ||
        search.isNotEmpty;
  }
}
