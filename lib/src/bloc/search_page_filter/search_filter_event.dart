part of 'search_filter_bloc.dart';

@Freezed(
  copyWith: false,
)
sealed class SearchFilterEvent with _$SearchFilterEvent {
  const factory SearchFilterEvent.categoryFilterChanged(int categoryId) =
      CategoryFilterChanged;
  const factory SearchFilterEvent.yearFilterChanged(int year) =
      YearFilterChanged;
  const factory SearchFilterEvent.countryFilterChanged(int countryId) =
      CountryFilterChanged;
  const factory SearchFilterEvent.searchFilterChanged(String keyword) =
      SearchFilterChanged;
  // Remove filter when user taps on filter chip on Search page
  const factory SearchFilterEvent.filterRemoved(String filterName,
      {required List<CategoryModel> categories,
      required List<CountryModel> countries}) = FilterRemoved;
  // Reset all filters when user taps on reset button on filter page
  const factory SearchFilterEvent.resetFilter() = ResetFilter;
  const factory SearchFilterEvent.changePage() = ChangePage;
  // apply filters on apply button tap on filter page
  const factory SearchFilterEvent.applyFilter({bool? loadNextPage}) =
      ApplyFilter;

  // Undo filters when user taps on back button on filter page
  const factory SearchFilterEvent.undoFilter({
    required List<int> initialCategories,
    required List<int> initialCountries,
  }) = UndoFilter;
  // Initialize the filter page with initial data
  const factory SearchFilterEvent.initialize() = Initialize;
  const factory SearchFilterEvent.initializeWithFilter(int categoryId) =
      InitializeWithFilter;
}
