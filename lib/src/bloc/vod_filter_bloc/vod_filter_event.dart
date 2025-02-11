part of 'vod_filter_bloc.dart';

@Freezed(
  copyWith: false,
)
sealed class VodFilterEvent with _$VodFilterEvent {
  const factory VodFilterEvent.categoryFilterChanged(int categoryId) =
      CategoryFilterChanged;
  const factory VodFilterEvent.yearFilterChanged(int year) = YearFilterChanged;
  const factory VodFilterEvent.countryFilterChanged(int countryId) =
      CountryFilterChanged;
  const factory VodFilterEvent.searchFilterChanged(String keyword) =
      SearchFilterChanged;
  // Remove filter when user taps on filter chip on vod page
  const factory VodFilterEvent.filterRemoved(String filterName,
      {required List<CategoryModel> categories,
      required List<CountryModel> countries}) = FilterRemoved;
  // Reset all filters when user taps on reset button on filter page
  const factory VodFilterEvent.resetFilter() = ResetFilter;
  const factory VodFilterEvent.changePage() = ChangePage;
  // apply filters on apply button tap on filter page
  const factory VodFilterEvent.applyFilter({bool? loadNextPage}) = ApplyFilter;

  // Undo filters when user taps on back button on filter page
  const factory VodFilterEvent.undoFilter({
    required List<int> initialCategories,
    required List<int> initialCountries,
  }) = UndoFilter;
  // Initialize the filter page with initial data
  const factory VodFilterEvent.initialize() = Initialize;
  const factory VodFilterEvent.initializeWithFilter(int categoryId) =
      InitializeWithFilter;
}
