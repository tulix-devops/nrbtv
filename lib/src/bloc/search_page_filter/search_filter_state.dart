part of 'search_filter_bloc.dart';

@freezed
class SearchFilterState with _$SearchFilterState {
  const SearchFilterState._();

  const factory SearchFilterState({
    @Default(<int>[]) List<int> categoryIds,
    @Default(<int>[]) List<int> countryIds,
    @Default(<int>[]) List<int> releaseYears,
    @Default(ContentType.channel) ContentType contentType,
    @Default('') String search,
    @Default(Status.initial) Status status,
    @Default([]) List<ContentModel> videos,
    @Default([]) List<ContentModel> savedVideos,
    @Default(1) int page,
    @Default(false) bool hasMorePages,
    String? error,
  }) = _SearchFilterState;

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
