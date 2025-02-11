// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VodFilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) categoryFilterChanged,
    required TResult Function(int year) yearFilterChanged,
    required TResult Function(int countryId) countryFilterChanged,
    required TResult Function(String keyword) searchFilterChanged,
    required TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)
        filterRemoved,
    required TResult Function() resetFilter,
    required TResult Function() changePage,
    required TResult Function(bool? loadNextPage) applyFilter,
    required TResult Function(
            List<int> initialCategories, List<int> initialCountries)
        undoFilter,
    required TResult Function() initialize,
    required TResult Function(int categoryId) initializeWithFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? categoryFilterChanged,
    TResult? Function(int year)? yearFilterChanged,
    TResult? Function(int countryId)? countryFilterChanged,
    TResult? Function(String keyword)? searchFilterChanged,
    TResult? Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult? Function()? resetFilter,
    TResult? Function()? changePage,
    TResult? Function(bool? loadNextPage)? applyFilter,
    TResult? Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult? Function()? initialize,
    TResult? Function(int categoryId)? initializeWithFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? categoryFilterChanged,
    TResult Function(int year)? yearFilterChanged,
    TResult Function(int countryId)? countryFilterChanged,
    TResult Function(String keyword)? searchFilterChanged,
    TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult Function()? resetFilter,
    TResult Function()? changePage,
    TResult Function(bool? loadNextPage)? applyFilter,
    TResult Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult Function()? initialize,
    TResult Function(int categoryId)? initializeWithFilter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFilterChanged value)
        categoryFilterChanged,
    required TResult Function(YearFilterChanged value) yearFilterChanged,
    required TResult Function(CountryFilterChanged value) countryFilterChanged,
    required TResult Function(SearchFilterChanged value) searchFilterChanged,
    required TResult Function(FilterRemoved value) filterRemoved,
    required TResult Function(ResetFilter value) resetFilter,
    required TResult Function(ChangePage value) changePage,
    required TResult Function(ApplyFilter value) applyFilter,
    required TResult Function(UndoFilter value) undoFilter,
    required TResult Function(Initialize value) initialize,
    required TResult Function(InitializeWithFilter value) initializeWithFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult? Function(YearFilterChanged value)? yearFilterChanged,
    TResult? Function(CountryFilterChanged value)? countryFilterChanged,
    TResult? Function(SearchFilterChanged value)? searchFilterChanged,
    TResult? Function(FilterRemoved value)? filterRemoved,
    TResult? Function(ResetFilter value)? resetFilter,
    TResult? Function(ChangePage value)? changePage,
    TResult? Function(ApplyFilter value)? applyFilter,
    TResult? Function(UndoFilter value)? undoFilter,
    TResult? Function(Initialize value)? initialize,
    TResult? Function(InitializeWithFilter value)? initializeWithFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult Function(YearFilterChanged value)? yearFilterChanged,
    TResult Function(CountryFilterChanged value)? countryFilterChanged,
    TResult Function(SearchFilterChanged value)? searchFilterChanged,
    TResult Function(FilterRemoved value)? filterRemoved,
    TResult Function(ResetFilter value)? resetFilter,
    TResult Function(ChangePage value)? changePage,
    TResult Function(ApplyFilter value)? applyFilter,
    TResult Function(UndoFilter value)? undoFilter,
    TResult Function(Initialize value)? initialize,
    TResult Function(InitializeWithFilter value)? initializeWithFilter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$CategoryFilterChangedImpl
    with DiagnosticableTreeMixin
    implements CategoryFilterChanged {
  const _$CategoryFilterChangedImpl(this.categoryId);

  @override
  final int categoryId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VodFilterEvent.categoryFilterChanged(categoryId: $categoryId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VodFilterEvent.categoryFilterChanged'))
      ..add(DiagnosticsProperty('categoryId', categoryId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryFilterChangedImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) categoryFilterChanged,
    required TResult Function(int year) yearFilterChanged,
    required TResult Function(int countryId) countryFilterChanged,
    required TResult Function(String keyword) searchFilterChanged,
    required TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)
        filterRemoved,
    required TResult Function() resetFilter,
    required TResult Function() changePage,
    required TResult Function(bool? loadNextPage) applyFilter,
    required TResult Function(
            List<int> initialCategories, List<int> initialCountries)
        undoFilter,
    required TResult Function() initialize,
    required TResult Function(int categoryId) initializeWithFilter,
  }) {
    return categoryFilterChanged(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? categoryFilterChanged,
    TResult? Function(int year)? yearFilterChanged,
    TResult? Function(int countryId)? countryFilterChanged,
    TResult? Function(String keyword)? searchFilterChanged,
    TResult? Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult? Function()? resetFilter,
    TResult? Function()? changePage,
    TResult? Function(bool? loadNextPage)? applyFilter,
    TResult? Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult? Function()? initialize,
    TResult? Function(int categoryId)? initializeWithFilter,
  }) {
    return categoryFilterChanged?.call(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? categoryFilterChanged,
    TResult Function(int year)? yearFilterChanged,
    TResult Function(int countryId)? countryFilterChanged,
    TResult Function(String keyword)? searchFilterChanged,
    TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult Function()? resetFilter,
    TResult Function()? changePage,
    TResult Function(bool? loadNextPage)? applyFilter,
    TResult Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult Function()? initialize,
    TResult Function(int categoryId)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (categoryFilterChanged != null) {
      return categoryFilterChanged(categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFilterChanged value)
        categoryFilterChanged,
    required TResult Function(YearFilterChanged value) yearFilterChanged,
    required TResult Function(CountryFilterChanged value) countryFilterChanged,
    required TResult Function(SearchFilterChanged value) searchFilterChanged,
    required TResult Function(FilterRemoved value) filterRemoved,
    required TResult Function(ResetFilter value) resetFilter,
    required TResult Function(ChangePage value) changePage,
    required TResult Function(ApplyFilter value) applyFilter,
    required TResult Function(UndoFilter value) undoFilter,
    required TResult Function(Initialize value) initialize,
    required TResult Function(InitializeWithFilter value) initializeWithFilter,
  }) {
    return categoryFilterChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult? Function(YearFilterChanged value)? yearFilterChanged,
    TResult? Function(CountryFilterChanged value)? countryFilterChanged,
    TResult? Function(SearchFilterChanged value)? searchFilterChanged,
    TResult? Function(FilterRemoved value)? filterRemoved,
    TResult? Function(ResetFilter value)? resetFilter,
    TResult? Function(ChangePage value)? changePage,
    TResult? Function(ApplyFilter value)? applyFilter,
    TResult? Function(UndoFilter value)? undoFilter,
    TResult? Function(Initialize value)? initialize,
    TResult? Function(InitializeWithFilter value)? initializeWithFilter,
  }) {
    return categoryFilterChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult Function(YearFilterChanged value)? yearFilterChanged,
    TResult Function(CountryFilterChanged value)? countryFilterChanged,
    TResult Function(SearchFilterChanged value)? searchFilterChanged,
    TResult Function(FilterRemoved value)? filterRemoved,
    TResult Function(ResetFilter value)? resetFilter,
    TResult Function(ChangePage value)? changePage,
    TResult Function(ApplyFilter value)? applyFilter,
    TResult Function(UndoFilter value)? undoFilter,
    TResult Function(Initialize value)? initialize,
    TResult Function(InitializeWithFilter value)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (categoryFilterChanged != null) {
      return categoryFilterChanged(this);
    }
    return orElse();
  }
}

abstract class CategoryFilterChanged implements VodFilterEvent {
  const factory CategoryFilterChanged(final int categoryId) =
      _$CategoryFilterChangedImpl;

  int get categoryId;
}

/// @nodoc

class _$YearFilterChangedImpl
    with DiagnosticableTreeMixin
    implements YearFilterChanged {
  const _$YearFilterChangedImpl(this.year);

  @override
  final int year;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VodFilterEvent.yearFilterChanged(year: $year)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VodFilterEvent.yearFilterChanged'))
      ..add(DiagnosticsProperty('year', year));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YearFilterChangedImpl &&
            (identical(other.year, year) || other.year == year));
  }

  @override
  int get hashCode => Object.hash(runtimeType, year);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) categoryFilterChanged,
    required TResult Function(int year) yearFilterChanged,
    required TResult Function(int countryId) countryFilterChanged,
    required TResult Function(String keyword) searchFilterChanged,
    required TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)
        filterRemoved,
    required TResult Function() resetFilter,
    required TResult Function() changePage,
    required TResult Function(bool? loadNextPage) applyFilter,
    required TResult Function(
            List<int> initialCategories, List<int> initialCountries)
        undoFilter,
    required TResult Function() initialize,
    required TResult Function(int categoryId) initializeWithFilter,
  }) {
    return yearFilterChanged(year);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? categoryFilterChanged,
    TResult? Function(int year)? yearFilterChanged,
    TResult? Function(int countryId)? countryFilterChanged,
    TResult? Function(String keyword)? searchFilterChanged,
    TResult? Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult? Function()? resetFilter,
    TResult? Function()? changePage,
    TResult? Function(bool? loadNextPage)? applyFilter,
    TResult? Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult? Function()? initialize,
    TResult? Function(int categoryId)? initializeWithFilter,
  }) {
    return yearFilterChanged?.call(year);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? categoryFilterChanged,
    TResult Function(int year)? yearFilterChanged,
    TResult Function(int countryId)? countryFilterChanged,
    TResult Function(String keyword)? searchFilterChanged,
    TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult Function()? resetFilter,
    TResult Function()? changePage,
    TResult Function(bool? loadNextPage)? applyFilter,
    TResult Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult Function()? initialize,
    TResult Function(int categoryId)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (yearFilterChanged != null) {
      return yearFilterChanged(year);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFilterChanged value)
        categoryFilterChanged,
    required TResult Function(YearFilterChanged value) yearFilterChanged,
    required TResult Function(CountryFilterChanged value) countryFilterChanged,
    required TResult Function(SearchFilterChanged value) searchFilterChanged,
    required TResult Function(FilterRemoved value) filterRemoved,
    required TResult Function(ResetFilter value) resetFilter,
    required TResult Function(ChangePage value) changePage,
    required TResult Function(ApplyFilter value) applyFilter,
    required TResult Function(UndoFilter value) undoFilter,
    required TResult Function(Initialize value) initialize,
    required TResult Function(InitializeWithFilter value) initializeWithFilter,
  }) {
    return yearFilterChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult? Function(YearFilterChanged value)? yearFilterChanged,
    TResult? Function(CountryFilterChanged value)? countryFilterChanged,
    TResult? Function(SearchFilterChanged value)? searchFilterChanged,
    TResult? Function(FilterRemoved value)? filterRemoved,
    TResult? Function(ResetFilter value)? resetFilter,
    TResult? Function(ChangePage value)? changePage,
    TResult? Function(ApplyFilter value)? applyFilter,
    TResult? Function(UndoFilter value)? undoFilter,
    TResult? Function(Initialize value)? initialize,
    TResult? Function(InitializeWithFilter value)? initializeWithFilter,
  }) {
    return yearFilterChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult Function(YearFilterChanged value)? yearFilterChanged,
    TResult Function(CountryFilterChanged value)? countryFilterChanged,
    TResult Function(SearchFilterChanged value)? searchFilterChanged,
    TResult Function(FilterRemoved value)? filterRemoved,
    TResult Function(ResetFilter value)? resetFilter,
    TResult Function(ChangePage value)? changePage,
    TResult Function(ApplyFilter value)? applyFilter,
    TResult Function(UndoFilter value)? undoFilter,
    TResult Function(Initialize value)? initialize,
    TResult Function(InitializeWithFilter value)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (yearFilterChanged != null) {
      return yearFilterChanged(this);
    }
    return orElse();
  }
}

abstract class YearFilterChanged implements VodFilterEvent {
  const factory YearFilterChanged(final int year) = _$YearFilterChangedImpl;

  int get year;
}

/// @nodoc

class _$CountryFilterChangedImpl
    with DiagnosticableTreeMixin
    implements CountryFilterChanged {
  const _$CountryFilterChangedImpl(this.countryId);

  @override
  final int countryId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VodFilterEvent.countryFilterChanged(countryId: $countryId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VodFilterEvent.countryFilterChanged'))
      ..add(DiagnosticsProperty('countryId', countryId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryFilterChangedImpl &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, countryId);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) categoryFilterChanged,
    required TResult Function(int year) yearFilterChanged,
    required TResult Function(int countryId) countryFilterChanged,
    required TResult Function(String keyword) searchFilterChanged,
    required TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)
        filterRemoved,
    required TResult Function() resetFilter,
    required TResult Function() changePage,
    required TResult Function(bool? loadNextPage) applyFilter,
    required TResult Function(
            List<int> initialCategories, List<int> initialCountries)
        undoFilter,
    required TResult Function() initialize,
    required TResult Function(int categoryId) initializeWithFilter,
  }) {
    return countryFilterChanged(countryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? categoryFilterChanged,
    TResult? Function(int year)? yearFilterChanged,
    TResult? Function(int countryId)? countryFilterChanged,
    TResult? Function(String keyword)? searchFilterChanged,
    TResult? Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult? Function()? resetFilter,
    TResult? Function()? changePage,
    TResult? Function(bool? loadNextPage)? applyFilter,
    TResult? Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult? Function()? initialize,
    TResult? Function(int categoryId)? initializeWithFilter,
  }) {
    return countryFilterChanged?.call(countryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? categoryFilterChanged,
    TResult Function(int year)? yearFilterChanged,
    TResult Function(int countryId)? countryFilterChanged,
    TResult Function(String keyword)? searchFilterChanged,
    TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult Function()? resetFilter,
    TResult Function()? changePage,
    TResult Function(bool? loadNextPage)? applyFilter,
    TResult Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult Function()? initialize,
    TResult Function(int categoryId)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (countryFilterChanged != null) {
      return countryFilterChanged(countryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFilterChanged value)
        categoryFilterChanged,
    required TResult Function(YearFilterChanged value) yearFilterChanged,
    required TResult Function(CountryFilterChanged value) countryFilterChanged,
    required TResult Function(SearchFilterChanged value) searchFilterChanged,
    required TResult Function(FilterRemoved value) filterRemoved,
    required TResult Function(ResetFilter value) resetFilter,
    required TResult Function(ChangePage value) changePage,
    required TResult Function(ApplyFilter value) applyFilter,
    required TResult Function(UndoFilter value) undoFilter,
    required TResult Function(Initialize value) initialize,
    required TResult Function(InitializeWithFilter value) initializeWithFilter,
  }) {
    return countryFilterChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult? Function(YearFilterChanged value)? yearFilterChanged,
    TResult? Function(CountryFilterChanged value)? countryFilterChanged,
    TResult? Function(SearchFilterChanged value)? searchFilterChanged,
    TResult? Function(FilterRemoved value)? filterRemoved,
    TResult? Function(ResetFilter value)? resetFilter,
    TResult? Function(ChangePage value)? changePage,
    TResult? Function(ApplyFilter value)? applyFilter,
    TResult? Function(UndoFilter value)? undoFilter,
    TResult? Function(Initialize value)? initialize,
    TResult? Function(InitializeWithFilter value)? initializeWithFilter,
  }) {
    return countryFilterChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult Function(YearFilterChanged value)? yearFilterChanged,
    TResult Function(CountryFilterChanged value)? countryFilterChanged,
    TResult Function(SearchFilterChanged value)? searchFilterChanged,
    TResult Function(FilterRemoved value)? filterRemoved,
    TResult Function(ResetFilter value)? resetFilter,
    TResult Function(ChangePage value)? changePage,
    TResult Function(ApplyFilter value)? applyFilter,
    TResult Function(UndoFilter value)? undoFilter,
    TResult Function(Initialize value)? initialize,
    TResult Function(InitializeWithFilter value)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (countryFilterChanged != null) {
      return countryFilterChanged(this);
    }
    return orElse();
  }
}

abstract class CountryFilterChanged implements VodFilterEvent {
  const factory CountryFilterChanged(final int countryId) =
      _$CountryFilterChangedImpl;

  int get countryId;
}

/// @nodoc

class _$SearchFilterChangedImpl
    with DiagnosticableTreeMixin
    implements SearchFilterChanged {
  const _$SearchFilterChangedImpl(this.keyword);

  @override
  final String keyword;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VodFilterEvent.searchFilterChanged(keyword: $keyword)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VodFilterEvent.searchFilterChanged'))
      ..add(DiagnosticsProperty('keyword', keyword));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchFilterChangedImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) categoryFilterChanged,
    required TResult Function(int year) yearFilterChanged,
    required TResult Function(int countryId) countryFilterChanged,
    required TResult Function(String keyword) searchFilterChanged,
    required TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)
        filterRemoved,
    required TResult Function() resetFilter,
    required TResult Function() changePage,
    required TResult Function(bool? loadNextPage) applyFilter,
    required TResult Function(
            List<int> initialCategories, List<int> initialCountries)
        undoFilter,
    required TResult Function() initialize,
    required TResult Function(int categoryId) initializeWithFilter,
  }) {
    return searchFilterChanged(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? categoryFilterChanged,
    TResult? Function(int year)? yearFilterChanged,
    TResult? Function(int countryId)? countryFilterChanged,
    TResult? Function(String keyword)? searchFilterChanged,
    TResult? Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult? Function()? resetFilter,
    TResult? Function()? changePage,
    TResult? Function(bool? loadNextPage)? applyFilter,
    TResult? Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult? Function()? initialize,
    TResult? Function(int categoryId)? initializeWithFilter,
  }) {
    return searchFilterChanged?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? categoryFilterChanged,
    TResult Function(int year)? yearFilterChanged,
    TResult Function(int countryId)? countryFilterChanged,
    TResult Function(String keyword)? searchFilterChanged,
    TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult Function()? resetFilter,
    TResult Function()? changePage,
    TResult Function(bool? loadNextPage)? applyFilter,
    TResult Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult Function()? initialize,
    TResult Function(int categoryId)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (searchFilterChanged != null) {
      return searchFilterChanged(keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFilterChanged value)
        categoryFilterChanged,
    required TResult Function(YearFilterChanged value) yearFilterChanged,
    required TResult Function(CountryFilterChanged value) countryFilterChanged,
    required TResult Function(SearchFilterChanged value) searchFilterChanged,
    required TResult Function(FilterRemoved value) filterRemoved,
    required TResult Function(ResetFilter value) resetFilter,
    required TResult Function(ChangePage value) changePage,
    required TResult Function(ApplyFilter value) applyFilter,
    required TResult Function(UndoFilter value) undoFilter,
    required TResult Function(Initialize value) initialize,
    required TResult Function(InitializeWithFilter value) initializeWithFilter,
  }) {
    return searchFilterChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult? Function(YearFilterChanged value)? yearFilterChanged,
    TResult? Function(CountryFilterChanged value)? countryFilterChanged,
    TResult? Function(SearchFilterChanged value)? searchFilterChanged,
    TResult? Function(FilterRemoved value)? filterRemoved,
    TResult? Function(ResetFilter value)? resetFilter,
    TResult? Function(ChangePage value)? changePage,
    TResult? Function(ApplyFilter value)? applyFilter,
    TResult? Function(UndoFilter value)? undoFilter,
    TResult? Function(Initialize value)? initialize,
    TResult? Function(InitializeWithFilter value)? initializeWithFilter,
  }) {
    return searchFilterChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult Function(YearFilterChanged value)? yearFilterChanged,
    TResult Function(CountryFilterChanged value)? countryFilterChanged,
    TResult Function(SearchFilterChanged value)? searchFilterChanged,
    TResult Function(FilterRemoved value)? filterRemoved,
    TResult Function(ResetFilter value)? resetFilter,
    TResult Function(ChangePage value)? changePage,
    TResult Function(ApplyFilter value)? applyFilter,
    TResult Function(UndoFilter value)? undoFilter,
    TResult Function(Initialize value)? initialize,
    TResult Function(InitializeWithFilter value)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (searchFilterChanged != null) {
      return searchFilterChanged(this);
    }
    return orElse();
  }
}

abstract class SearchFilterChanged implements VodFilterEvent {
  const factory SearchFilterChanged(final String keyword) =
      _$SearchFilterChangedImpl;

  String get keyword;
}

/// @nodoc

class _$FilterRemovedImpl
    with DiagnosticableTreeMixin
    implements FilterRemoved {
  const _$FilterRemovedImpl(this.filterName,
      {required final List<CategoryModel> categories,
      required final List<CountryModel> countries})
      : _categories = categories,
        _countries = countries;

  @override
  final String filterName;
  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<CountryModel> _countries;
  @override
  List<CountryModel> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VodFilterEvent.filterRemoved(filterName: $filterName, categories: $categories, countries: $countries)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VodFilterEvent.filterRemoved'))
      ..add(DiagnosticsProperty('filterName', filterName))
      ..add(DiagnosticsProperty('categories', categories))
      ..add(DiagnosticsProperty('countries', countries));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterRemovedImpl &&
            (identical(other.filterName, filterName) ||
                other.filterName == filterName) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      filterName,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_countries));

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) categoryFilterChanged,
    required TResult Function(int year) yearFilterChanged,
    required TResult Function(int countryId) countryFilterChanged,
    required TResult Function(String keyword) searchFilterChanged,
    required TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)
        filterRemoved,
    required TResult Function() resetFilter,
    required TResult Function() changePage,
    required TResult Function(bool? loadNextPage) applyFilter,
    required TResult Function(
            List<int> initialCategories, List<int> initialCountries)
        undoFilter,
    required TResult Function() initialize,
    required TResult Function(int categoryId) initializeWithFilter,
  }) {
    return filterRemoved(filterName, categories, countries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? categoryFilterChanged,
    TResult? Function(int year)? yearFilterChanged,
    TResult? Function(int countryId)? countryFilterChanged,
    TResult? Function(String keyword)? searchFilterChanged,
    TResult? Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult? Function()? resetFilter,
    TResult? Function()? changePage,
    TResult? Function(bool? loadNextPage)? applyFilter,
    TResult? Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult? Function()? initialize,
    TResult? Function(int categoryId)? initializeWithFilter,
  }) {
    return filterRemoved?.call(filterName, categories, countries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? categoryFilterChanged,
    TResult Function(int year)? yearFilterChanged,
    TResult Function(int countryId)? countryFilterChanged,
    TResult Function(String keyword)? searchFilterChanged,
    TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult Function()? resetFilter,
    TResult Function()? changePage,
    TResult Function(bool? loadNextPage)? applyFilter,
    TResult Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult Function()? initialize,
    TResult Function(int categoryId)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (filterRemoved != null) {
      return filterRemoved(filterName, categories, countries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFilterChanged value)
        categoryFilterChanged,
    required TResult Function(YearFilterChanged value) yearFilterChanged,
    required TResult Function(CountryFilterChanged value) countryFilterChanged,
    required TResult Function(SearchFilterChanged value) searchFilterChanged,
    required TResult Function(FilterRemoved value) filterRemoved,
    required TResult Function(ResetFilter value) resetFilter,
    required TResult Function(ChangePage value) changePage,
    required TResult Function(ApplyFilter value) applyFilter,
    required TResult Function(UndoFilter value) undoFilter,
    required TResult Function(Initialize value) initialize,
    required TResult Function(InitializeWithFilter value) initializeWithFilter,
  }) {
    return filterRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult? Function(YearFilterChanged value)? yearFilterChanged,
    TResult? Function(CountryFilterChanged value)? countryFilterChanged,
    TResult? Function(SearchFilterChanged value)? searchFilterChanged,
    TResult? Function(FilterRemoved value)? filterRemoved,
    TResult? Function(ResetFilter value)? resetFilter,
    TResult? Function(ChangePage value)? changePage,
    TResult? Function(ApplyFilter value)? applyFilter,
    TResult? Function(UndoFilter value)? undoFilter,
    TResult? Function(Initialize value)? initialize,
    TResult? Function(InitializeWithFilter value)? initializeWithFilter,
  }) {
    return filterRemoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult Function(YearFilterChanged value)? yearFilterChanged,
    TResult Function(CountryFilterChanged value)? countryFilterChanged,
    TResult Function(SearchFilterChanged value)? searchFilterChanged,
    TResult Function(FilterRemoved value)? filterRemoved,
    TResult Function(ResetFilter value)? resetFilter,
    TResult Function(ChangePage value)? changePage,
    TResult Function(ApplyFilter value)? applyFilter,
    TResult Function(UndoFilter value)? undoFilter,
    TResult Function(Initialize value)? initialize,
    TResult Function(InitializeWithFilter value)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (filterRemoved != null) {
      return filterRemoved(this);
    }
    return orElse();
  }
}

abstract class FilterRemoved implements VodFilterEvent {
  const factory FilterRemoved(final String filterName,
      {required final List<CategoryModel> categories,
      required final List<CountryModel> countries}) = _$FilterRemovedImpl;

  String get filterName;
  List<CategoryModel> get categories;
  List<CountryModel> get countries;
}

/// @nodoc

class _$ResetFilterImpl with DiagnosticableTreeMixin implements ResetFilter {
  const _$ResetFilterImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VodFilterEvent.resetFilter()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'VodFilterEvent.resetFilter'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetFilterImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) categoryFilterChanged,
    required TResult Function(int year) yearFilterChanged,
    required TResult Function(int countryId) countryFilterChanged,
    required TResult Function(String keyword) searchFilterChanged,
    required TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)
        filterRemoved,
    required TResult Function() resetFilter,
    required TResult Function() changePage,
    required TResult Function(bool? loadNextPage) applyFilter,
    required TResult Function(
            List<int> initialCategories, List<int> initialCountries)
        undoFilter,
    required TResult Function() initialize,
    required TResult Function(int categoryId) initializeWithFilter,
  }) {
    return resetFilter();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? categoryFilterChanged,
    TResult? Function(int year)? yearFilterChanged,
    TResult? Function(int countryId)? countryFilterChanged,
    TResult? Function(String keyword)? searchFilterChanged,
    TResult? Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult? Function()? resetFilter,
    TResult? Function()? changePage,
    TResult? Function(bool? loadNextPage)? applyFilter,
    TResult? Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult? Function()? initialize,
    TResult? Function(int categoryId)? initializeWithFilter,
  }) {
    return resetFilter?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? categoryFilterChanged,
    TResult Function(int year)? yearFilterChanged,
    TResult Function(int countryId)? countryFilterChanged,
    TResult Function(String keyword)? searchFilterChanged,
    TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult Function()? resetFilter,
    TResult Function()? changePage,
    TResult Function(bool? loadNextPage)? applyFilter,
    TResult Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult Function()? initialize,
    TResult Function(int categoryId)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (resetFilter != null) {
      return resetFilter();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFilterChanged value)
        categoryFilterChanged,
    required TResult Function(YearFilterChanged value) yearFilterChanged,
    required TResult Function(CountryFilterChanged value) countryFilterChanged,
    required TResult Function(SearchFilterChanged value) searchFilterChanged,
    required TResult Function(FilterRemoved value) filterRemoved,
    required TResult Function(ResetFilter value) resetFilter,
    required TResult Function(ChangePage value) changePage,
    required TResult Function(ApplyFilter value) applyFilter,
    required TResult Function(UndoFilter value) undoFilter,
    required TResult Function(Initialize value) initialize,
    required TResult Function(InitializeWithFilter value) initializeWithFilter,
  }) {
    return resetFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult? Function(YearFilterChanged value)? yearFilterChanged,
    TResult? Function(CountryFilterChanged value)? countryFilterChanged,
    TResult? Function(SearchFilterChanged value)? searchFilterChanged,
    TResult? Function(FilterRemoved value)? filterRemoved,
    TResult? Function(ResetFilter value)? resetFilter,
    TResult? Function(ChangePage value)? changePage,
    TResult? Function(ApplyFilter value)? applyFilter,
    TResult? Function(UndoFilter value)? undoFilter,
    TResult? Function(Initialize value)? initialize,
    TResult? Function(InitializeWithFilter value)? initializeWithFilter,
  }) {
    return resetFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult Function(YearFilterChanged value)? yearFilterChanged,
    TResult Function(CountryFilterChanged value)? countryFilterChanged,
    TResult Function(SearchFilterChanged value)? searchFilterChanged,
    TResult Function(FilterRemoved value)? filterRemoved,
    TResult Function(ResetFilter value)? resetFilter,
    TResult Function(ChangePage value)? changePage,
    TResult Function(ApplyFilter value)? applyFilter,
    TResult Function(UndoFilter value)? undoFilter,
    TResult Function(Initialize value)? initialize,
    TResult Function(InitializeWithFilter value)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (resetFilter != null) {
      return resetFilter(this);
    }
    return orElse();
  }
}

abstract class ResetFilter implements VodFilterEvent {
  const factory ResetFilter() = _$ResetFilterImpl;
}

/// @nodoc

class _$ChangePageImpl with DiagnosticableTreeMixin implements ChangePage {
  const _$ChangePageImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VodFilterEvent.changePage()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'VodFilterEvent.changePage'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChangePageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) categoryFilterChanged,
    required TResult Function(int year) yearFilterChanged,
    required TResult Function(int countryId) countryFilterChanged,
    required TResult Function(String keyword) searchFilterChanged,
    required TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)
        filterRemoved,
    required TResult Function() resetFilter,
    required TResult Function() changePage,
    required TResult Function(bool? loadNextPage) applyFilter,
    required TResult Function(
            List<int> initialCategories, List<int> initialCountries)
        undoFilter,
    required TResult Function() initialize,
    required TResult Function(int categoryId) initializeWithFilter,
  }) {
    return changePage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? categoryFilterChanged,
    TResult? Function(int year)? yearFilterChanged,
    TResult? Function(int countryId)? countryFilterChanged,
    TResult? Function(String keyword)? searchFilterChanged,
    TResult? Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult? Function()? resetFilter,
    TResult? Function()? changePage,
    TResult? Function(bool? loadNextPage)? applyFilter,
    TResult? Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult? Function()? initialize,
    TResult? Function(int categoryId)? initializeWithFilter,
  }) {
    return changePage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? categoryFilterChanged,
    TResult Function(int year)? yearFilterChanged,
    TResult Function(int countryId)? countryFilterChanged,
    TResult Function(String keyword)? searchFilterChanged,
    TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult Function()? resetFilter,
    TResult Function()? changePage,
    TResult Function(bool? loadNextPage)? applyFilter,
    TResult Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult Function()? initialize,
    TResult Function(int categoryId)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (changePage != null) {
      return changePage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFilterChanged value)
        categoryFilterChanged,
    required TResult Function(YearFilterChanged value) yearFilterChanged,
    required TResult Function(CountryFilterChanged value) countryFilterChanged,
    required TResult Function(SearchFilterChanged value) searchFilterChanged,
    required TResult Function(FilterRemoved value) filterRemoved,
    required TResult Function(ResetFilter value) resetFilter,
    required TResult Function(ChangePage value) changePage,
    required TResult Function(ApplyFilter value) applyFilter,
    required TResult Function(UndoFilter value) undoFilter,
    required TResult Function(Initialize value) initialize,
    required TResult Function(InitializeWithFilter value) initializeWithFilter,
  }) {
    return changePage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult? Function(YearFilterChanged value)? yearFilterChanged,
    TResult? Function(CountryFilterChanged value)? countryFilterChanged,
    TResult? Function(SearchFilterChanged value)? searchFilterChanged,
    TResult? Function(FilterRemoved value)? filterRemoved,
    TResult? Function(ResetFilter value)? resetFilter,
    TResult? Function(ChangePage value)? changePage,
    TResult? Function(ApplyFilter value)? applyFilter,
    TResult? Function(UndoFilter value)? undoFilter,
    TResult? Function(Initialize value)? initialize,
    TResult? Function(InitializeWithFilter value)? initializeWithFilter,
  }) {
    return changePage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult Function(YearFilterChanged value)? yearFilterChanged,
    TResult Function(CountryFilterChanged value)? countryFilterChanged,
    TResult Function(SearchFilterChanged value)? searchFilterChanged,
    TResult Function(FilterRemoved value)? filterRemoved,
    TResult Function(ResetFilter value)? resetFilter,
    TResult Function(ChangePage value)? changePage,
    TResult Function(ApplyFilter value)? applyFilter,
    TResult Function(UndoFilter value)? undoFilter,
    TResult Function(Initialize value)? initialize,
    TResult Function(InitializeWithFilter value)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (changePage != null) {
      return changePage(this);
    }
    return orElse();
  }
}

abstract class ChangePage implements VodFilterEvent {
  const factory ChangePage() = _$ChangePageImpl;
}

/// @nodoc

class _$ApplyFilterImpl with DiagnosticableTreeMixin implements ApplyFilter {
  const _$ApplyFilterImpl({this.loadNextPage});

  @override
  final bool? loadNextPage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VodFilterEvent.applyFilter(loadNextPage: $loadNextPage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VodFilterEvent.applyFilter'))
      ..add(DiagnosticsProperty('loadNextPage', loadNextPage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyFilterImpl &&
            (identical(other.loadNextPage, loadNextPage) ||
                other.loadNextPage == loadNextPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadNextPage);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) categoryFilterChanged,
    required TResult Function(int year) yearFilterChanged,
    required TResult Function(int countryId) countryFilterChanged,
    required TResult Function(String keyword) searchFilterChanged,
    required TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)
        filterRemoved,
    required TResult Function() resetFilter,
    required TResult Function() changePage,
    required TResult Function(bool? loadNextPage) applyFilter,
    required TResult Function(
            List<int> initialCategories, List<int> initialCountries)
        undoFilter,
    required TResult Function() initialize,
    required TResult Function(int categoryId) initializeWithFilter,
  }) {
    return applyFilter(loadNextPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? categoryFilterChanged,
    TResult? Function(int year)? yearFilterChanged,
    TResult? Function(int countryId)? countryFilterChanged,
    TResult? Function(String keyword)? searchFilterChanged,
    TResult? Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult? Function()? resetFilter,
    TResult? Function()? changePage,
    TResult? Function(bool? loadNextPage)? applyFilter,
    TResult? Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult? Function()? initialize,
    TResult? Function(int categoryId)? initializeWithFilter,
  }) {
    return applyFilter?.call(loadNextPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? categoryFilterChanged,
    TResult Function(int year)? yearFilterChanged,
    TResult Function(int countryId)? countryFilterChanged,
    TResult Function(String keyword)? searchFilterChanged,
    TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult Function()? resetFilter,
    TResult Function()? changePage,
    TResult Function(bool? loadNextPage)? applyFilter,
    TResult Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult Function()? initialize,
    TResult Function(int categoryId)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (applyFilter != null) {
      return applyFilter(loadNextPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFilterChanged value)
        categoryFilterChanged,
    required TResult Function(YearFilterChanged value) yearFilterChanged,
    required TResult Function(CountryFilterChanged value) countryFilterChanged,
    required TResult Function(SearchFilterChanged value) searchFilterChanged,
    required TResult Function(FilterRemoved value) filterRemoved,
    required TResult Function(ResetFilter value) resetFilter,
    required TResult Function(ChangePage value) changePage,
    required TResult Function(ApplyFilter value) applyFilter,
    required TResult Function(UndoFilter value) undoFilter,
    required TResult Function(Initialize value) initialize,
    required TResult Function(InitializeWithFilter value) initializeWithFilter,
  }) {
    return applyFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult? Function(YearFilterChanged value)? yearFilterChanged,
    TResult? Function(CountryFilterChanged value)? countryFilterChanged,
    TResult? Function(SearchFilterChanged value)? searchFilterChanged,
    TResult? Function(FilterRemoved value)? filterRemoved,
    TResult? Function(ResetFilter value)? resetFilter,
    TResult? Function(ChangePage value)? changePage,
    TResult? Function(ApplyFilter value)? applyFilter,
    TResult? Function(UndoFilter value)? undoFilter,
    TResult? Function(Initialize value)? initialize,
    TResult? Function(InitializeWithFilter value)? initializeWithFilter,
  }) {
    return applyFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult Function(YearFilterChanged value)? yearFilterChanged,
    TResult Function(CountryFilterChanged value)? countryFilterChanged,
    TResult Function(SearchFilterChanged value)? searchFilterChanged,
    TResult Function(FilterRemoved value)? filterRemoved,
    TResult Function(ResetFilter value)? resetFilter,
    TResult Function(ChangePage value)? changePage,
    TResult Function(ApplyFilter value)? applyFilter,
    TResult Function(UndoFilter value)? undoFilter,
    TResult Function(Initialize value)? initialize,
    TResult Function(InitializeWithFilter value)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (applyFilter != null) {
      return applyFilter(this);
    }
    return orElse();
  }
}

abstract class ApplyFilter implements VodFilterEvent {
  const factory ApplyFilter({final bool? loadNextPage}) = _$ApplyFilterImpl;

  bool? get loadNextPage;
}

/// @nodoc

class _$UndoFilterImpl with DiagnosticableTreeMixin implements UndoFilter {
  const _$UndoFilterImpl(
      {required final List<int> initialCategories,
      required final List<int> initialCountries})
      : _initialCategories = initialCategories,
        _initialCountries = initialCountries;

  final List<int> _initialCategories;
  @override
  List<int> get initialCategories {
    if (_initialCategories is EqualUnmodifiableListView)
      return _initialCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_initialCategories);
  }

  final List<int> _initialCountries;
  @override
  List<int> get initialCountries {
    if (_initialCountries is EqualUnmodifiableListView)
      return _initialCountries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_initialCountries);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VodFilterEvent.undoFilter(initialCategories: $initialCategories, initialCountries: $initialCountries)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VodFilterEvent.undoFilter'))
      ..add(DiagnosticsProperty('initialCategories', initialCategories))
      ..add(DiagnosticsProperty('initialCountries', initialCountries));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UndoFilterImpl &&
            const DeepCollectionEquality()
                .equals(other._initialCategories, _initialCategories) &&
            const DeepCollectionEquality()
                .equals(other._initialCountries, _initialCountries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_initialCategories),
      const DeepCollectionEquality().hash(_initialCountries));

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) categoryFilterChanged,
    required TResult Function(int year) yearFilterChanged,
    required TResult Function(int countryId) countryFilterChanged,
    required TResult Function(String keyword) searchFilterChanged,
    required TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)
        filterRemoved,
    required TResult Function() resetFilter,
    required TResult Function() changePage,
    required TResult Function(bool? loadNextPage) applyFilter,
    required TResult Function(
            List<int> initialCategories, List<int> initialCountries)
        undoFilter,
    required TResult Function() initialize,
    required TResult Function(int categoryId) initializeWithFilter,
  }) {
    return undoFilter(initialCategories, initialCountries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? categoryFilterChanged,
    TResult? Function(int year)? yearFilterChanged,
    TResult? Function(int countryId)? countryFilterChanged,
    TResult? Function(String keyword)? searchFilterChanged,
    TResult? Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult? Function()? resetFilter,
    TResult? Function()? changePage,
    TResult? Function(bool? loadNextPage)? applyFilter,
    TResult? Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult? Function()? initialize,
    TResult? Function(int categoryId)? initializeWithFilter,
  }) {
    return undoFilter?.call(initialCategories, initialCountries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? categoryFilterChanged,
    TResult Function(int year)? yearFilterChanged,
    TResult Function(int countryId)? countryFilterChanged,
    TResult Function(String keyword)? searchFilterChanged,
    TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult Function()? resetFilter,
    TResult Function()? changePage,
    TResult Function(bool? loadNextPage)? applyFilter,
    TResult Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult Function()? initialize,
    TResult Function(int categoryId)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (undoFilter != null) {
      return undoFilter(initialCategories, initialCountries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFilterChanged value)
        categoryFilterChanged,
    required TResult Function(YearFilterChanged value) yearFilterChanged,
    required TResult Function(CountryFilterChanged value) countryFilterChanged,
    required TResult Function(SearchFilterChanged value) searchFilterChanged,
    required TResult Function(FilterRemoved value) filterRemoved,
    required TResult Function(ResetFilter value) resetFilter,
    required TResult Function(ChangePage value) changePage,
    required TResult Function(ApplyFilter value) applyFilter,
    required TResult Function(UndoFilter value) undoFilter,
    required TResult Function(Initialize value) initialize,
    required TResult Function(InitializeWithFilter value) initializeWithFilter,
  }) {
    return undoFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult? Function(YearFilterChanged value)? yearFilterChanged,
    TResult? Function(CountryFilterChanged value)? countryFilterChanged,
    TResult? Function(SearchFilterChanged value)? searchFilterChanged,
    TResult? Function(FilterRemoved value)? filterRemoved,
    TResult? Function(ResetFilter value)? resetFilter,
    TResult? Function(ChangePage value)? changePage,
    TResult? Function(ApplyFilter value)? applyFilter,
    TResult? Function(UndoFilter value)? undoFilter,
    TResult? Function(Initialize value)? initialize,
    TResult? Function(InitializeWithFilter value)? initializeWithFilter,
  }) {
    return undoFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult Function(YearFilterChanged value)? yearFilterChanged,
    TResult Function(CountryFilterChanged value)? countryFilterChanged,
    TResult Function(SearchFilterChanged value)? searchFilterChanged,
    TResult Function(FilterRemoved value)? filterRemoved,
    TResult Function(ResetFilter value)? resetFilter,
    TResult Function(ChangePage value)? changePage,
    TResult Function(ApplyFilter value)? applyFilter,
    TResult Function(UndoFilter value)? undoFilter,
    TResult Function(Initialize value)? initialize,
    TResult Function(InitializeWithFilter value)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (undoFilter != null) {
      return undoFilter(this);
    }
    return orElse();
  }
}

abstract class UndoFilter implements VodFilterEvent {
  const factory UndoFilter(
      {required final List<int> initialCategories,
      required final List<int> initialCountries}) = _$UndoFilterImpl;

  List<int> get initialCategories;
  List<int> get initialCountries;
}

/// @nodoc

class _$InitializeImpl with DiagnosticableTreeMixin implements Initialize {
  const _$InitializeImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VodFilterEvent.initialize()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'VodFilterEvent.initialize'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) categoryFilterChanged,
    required TResult Function(int year) yearFilterChanged,
    required TResult Function(int countryId) countryFilterChanged,
    required TResult Function(String keyword) searchFilterChanged,
    required TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)
        filterRemoved,
    required TResult Function() resetFilter,
    required TResult Function() changePage,
    required TResult Function(bool? loadNextPage) applyFilter,
    required TResult Function(
            List<int> initialCategories, List<int> initialCountries)
        undoFilter,
    required TResult Function() initialize,
    required TResult Function(int categoryId) initializeWithFilter,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? categoryFilterChanged,
    TResult? Function(int year)? yearFilterChanged,
    TResult? Function(int countryId)? countryFilterChanged,
    TResult? Function(String keyword)? searchFilterChanged,
    TResult? Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult? Function()? resetFilter,
    TResult? Function()? changePage,
    TResult? Function(bool? loadNextPage)? applyFilter,
    TResult? Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult? Function()? initialize,
    TResult? Function(int categoryId)? initializeWithFilter,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? categoryFilterChanged,
    TResult Function(int year)? yearFilterChanged,
    TResult Function(int countryId)? countryFilterChanged,
    TResult Function(String keyword)? searchFilterChanged,
    TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult Function()? resetFilter,
    TResult Function()? changePage,
    TResult Function(bool? loadNextPage)? applyFilter,
    TResult Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult Function()? initialize,
    TResult Function(int categoryId)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFilterChanged value)
        categoryFilterChanged,
    required TResult Function(YearFilterChanged value) yearFilterChanged,
    required TResult Function(CountryFilterChanged value) countryFilterChanged,
    required TResult Function(SearchFilterChanged value) searchFilterChanged,
    required TResult Function(FilterRemoved value) filterRemoved,
    required TResult Function(ResetFilter value) resetFilter,
    required TResult Function(ChangePage value) changePage,
    required TResult Function(ApplyFilter value) applyFilter,
    required TResult Function(UndoFilter value) undoFilter,
    required TResult Function(Initialize value) initialize,
    required TResult Function(InitializeWithFilter value) initializeWithFilter,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult? Function(YearFilterChanged value)? yearFilterChanged,
    TResult? Function(CountryFilterChanged value)? countryFilterChanged,
    TResult? Function(SearchFilterChanged value)? searchFilterChanged,
    TResult? Function(FilterRemoved value)? filterRemoved,
    TResult? Function(ResetFilter value)? resetFilter,
    TResult? Function(ChangePage value)? changePage,
    TResult? Function(ApplyFilter value)? applyFilter,
    TResult? Function(UndoFilter value)? undoFilter,
    TResult? Function(Initialize value)? initialize,
    TResult? Function(InitializeWithFilter value)? initializeWithFilter,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult Function(YearFilterChanged value)? yearFilterChanged,
    TResult Function(CountryFilterChanged value)? countryFilterChanged,
    TResult Function(SearchFilterChanged value)? searchFilterChanged,
    TResult Function(FilterRemoved value)? filterRemoved,
    TResult Function(ResetFilter value)? resetFilter,
    TResult Function(ChangePage value)? changePage,
    TResult Function(ApplyFilter value)? applyFilter,
    TResult Function(UndoFilter value)? undoFilter,
    TResult Function(Initialize value)? initialize,
    TResult Function(InitializeWithFilter value)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class Initialize implements VodFilterEvent {
  const factory Initialize() = _$InitializeImpl;
}

/// @nodoc

class _$InitializeWithFilterImpl
    with DiagnosticableTreeMixin
    implements InitializeWithFilter {
  const _$InitializeWithFilterImpl(this.categoryId);

  @override
  final int categoryId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VodFilterEvent.initializeWithFilter(categoryId: $categoryId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VodFilterEvent.initializeWithFilter'))
      ..add(DiagnosticsProperty('categoryId', categoryId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeWithFilterImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) categoryFilterChanged,
    required TResult Function(int year) yearFilterChanged,
    required TResult Function(int countryId) countryFilterChanged,
    required TResult Function(String keyword) searchFilterChanged,
    required TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)
        filterRemoved,
    required TResult Function() resetFilter,
    required TResult Function() changePage,
    required TResult Function(bool? loadNextPage) applyFilter,
    required TResult Function(
            List<int> initialCategories, List<int> initialCountries)
        undoFilter,
    required TResult Function() initialize,
    required TResult Function(int categoryId) initializeWithFilter,
  }) {
    return initializeWithFilter(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? categoryFilterChanged,
    TResult? Function(int year)? yearFilterChanged,
    TResult? Function(int countryId)? countryFilterChanged,
    TResult? Function(String keyword)? searchFilterChanged,
    TResult? Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult? Function()? resetFilter,
    TResult? Function()? changePage,
    TResult? Function(bool? loadNextPage)? applyFilter,
    TResult? Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult? Function()? initialize,
    TResult? Function(int categoryId)? initializeWithFilter,
  }) {
    return initializeWithFilter?.call(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? categoryFilterChanged,
    TResult Function(int year)? yearFilterChanged,
    TResult Function(int countryId)? countryFilterChanged,
    TResult Function(String keyword)? searchFilterChanged,
    TResult Function(String filterName, List<CategoryModel> categories,
            List<CountryModel> countries)?
        filterRemoved,
    TResult Function()? resetFilter,
    TResult Function()? changePage,
    TResult Function(bool? loadNextPage)? applyFilter,
    TResult Function(List<int> initialCategories, List<int> initialCountries)?
        undoFilter,
    TResult Function()? initialize,
    TResult Function(int categoryId)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (initializeWithFilter != null) {
      return initializeWithFilter(categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFilterChanged value)
        categoryFilterChanged,
    required TResult Function(YearFilterChanged value) yearFilterChanged,
    required TResult Function(CountryFilterChanged value) countryFilterChanged,
    required TResult Function(SearchFilterChanged value) searchFilterChanged,
    required TResult Function(FilterRemoved value) filterRemoved,
    required TResult Function(ResetFilter value) resetFilter,
    required TResult Function(ChangePage value) changePage,
    required TResult Function(ApplyFilter value) applyFilter,
    required TResult Function(UndoFilter value) undoFilter,
    required TResult Function(Initialize value) initialize,
    required TResult Function(InitializeWithFilter value) initializeWithFilter,
  }) {
    return initializeWithFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult? Function(YearFilterChanged value)? yearFilterChanged,
    TResult? Function(CountryFilterChanged value)? countryFilterChanged,
    TResult? Function(SearchFilterChanged value)? searchFilterChanged,
    TResult? Function(FilterRemoved value)? filterRemoved,
    TResult? Function(ResetFilter value)? resetFilter,
    TResult? Function(ChangePage value)? changePage,
    TResult? Function(ApplyFilter value)? applyFilter,
    TResult? Function(UndoFilter value)? undoFilter,
    TResult? Function(Initialize value)? initialize,
    TResult? Function(InitializeWithFilter value)? initializeWithFilter,
  }) {
    return initializeWithFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFilterChanged value)? categoryFilterChanged,
    TResult Function(YearFilterChanged value)? yearFilterChanged,
    TResult Function(CountryFilterChanged value)? countryFilterChanged,
    TResult Function(SearchFilterChanged value)? searchFilterChanged,
    TResult Function(FilterRemoved value)? filterRemoved,
    TResult Function(ResetFilter value)? resetFilter,
    TResult Function(ChangePage value)? changePage,
    TResult Function(ApplyFilter value)? applyFilter,
    TResult Function(UndoFilter value)? undoFilter,
    TResult Function(Initialize value)? initialize,
    TResult Function(InitializeWithFilter value)? initializeWithFilter,
    required TResult orElse(),
  }) {
    if (initializeWithFilter != null) {
      return initializeWithFilter(this);
    }
    return orElse();
  }
}

abstract class InitializeWithFilter implements VodFilterEvent {
  const factory InitializeWithFilter(final int categoryId) =
      _$InitializeWithFilterImpl;

  int get categoryId;
}

/// @nodoc
mixin _$VodFilterState {
  List<int> get categoryIds => throw _privateConstructorUsedError;
  List<int> get countryIds => throw _privateConstructorUsedError;
  List<int> get releaseYears => throw _privateConstructorUsedError;
  String get search => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  List<VodModel> get videos => throw _privateConstructorUsedError;
  List<VodModel> get savedVideos => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get hasMorePages => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of VodFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VodFilterStateCopyWith<VodFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VodFilterStateCopyWith<$Res> {
  factory $VodFilterStateCopyWith(
          VodFilterState value, $Res Function(VodFilterState) then) =
      _$VodFilterStateCopyWithImpl<$Res, VodFilterState>;
  @useResult
  $Res call(
      {List<int> categoryIds,
      List<int> countryIds,
      List<int> releaseYears,
      String search,
      Status status,
      List<VodModel> videos,
      List<VodModel> savedVideos,
      int page,
      bool hasMorePages,
      String? error});
}

/// @nodoc
class _$VodFilterStateCopyWithImpl<$Res, $Val extends VodFilterState>
    implements $VodFilterStateCopyWith<$Res> {
  _$VodFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VodFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryIds = null,
    Object? countryIds = null,
    Object? releaseYears = null,
    Object? search = null,
    Object? status = null,
    Object? videos = null,
    Object? savedVideos = null,
    Object? page = null,
    Object? hasMorePages = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      categoryIds: null == categoryIds
          ? _value.categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      countryIds: null == countryIds
          ? _value.countryIds
          : countryIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      releaseYears: null == releaseYears
          ? _value.releaseYears
          : releaseYears // ignore: cast_nullable_to_non_nullable
              as List<int>,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      videos: null == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<VodModel>,
      savedVideos: null == savedVideos
          ? _value.savedVideos
          : savedVideos // ignore: cast_nullable_to_non_nullable
              as List<VodModel>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasMorePages: null == hasMorePages
          ? _value.hasMorePages
          : hasMorePages // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VodFilterStateImplCopyWith<$Res>
    implements $VodFilterStateCopyWith<$Res> {
  factory _$$VodFilterStateImplCopyWith(_$VodFilterStateImpl value,
          $Res Function(_$VodFilterStateImpl) then) =
      __$$VodFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<int> categoryIds,
      List<int> countryIds,
      List<int> releaseYears,
      String search,
      Status status,
      List<VodModel> videos,
      List<VodModel> savedVideos,
      int page,
      bool hasMorePages,
      String? error});
}

/// @nodoc
class __$$VodFilterStateImplCopyWithImpl<$Res>
    extends _$VodFilterStateCopyWithImpl<$Res, _$VodFilterStateImpl>
    implements _$$VodFilterStateImplCopyWith<$Res> {
  __$$VodFilterStateImplCopyWithImpl(
      _$VodFilterStateImpl _value, $Res Function(_$VodFilterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VodFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryIds = null,
    Object? countryIds = null,
    Object? releaseYears = null,
    Object? search = null,
    Object? status = null,
    Object? videos = null,
    Object? savedVideos = null,
    Object? page = null,
    Object? hasMorePages = null,
    Object? error = freezed,
  }) {
    return _then(_$VodFilterStateImpl(
      categoryIds: null == categoryIds
          ? _value._categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      countryIds: null == countryIds
          ? _value._countryIds
          : countryIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      releaseYears: null == releaseYears
          ? _value._releaseYears
          : releaseYears // ignore: cast_nullable_to_non_nullable
              as List<int>,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      videos: null == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<VodModel>,
      savedVideos: null == savedVideos
          ? _value._savedVideos
          : savedVideos // ignore: cast_nullable_to_non_nullable
              as List<VodModel>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasMorePages: null == hasMorePages
          ? _value.hasMorePages
          : hasMorePages // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$VodFilterStateImpl extends _VodFilterState
    with DiagnosticableTreeMixin {
  const _$VodFilterStateImpl(
      {final List<int> categoryIds = const <int>[],
      final List<int> countryIds = const <int>[],
      final List<int> releaseYears = const <int>[],
      this.search = '',
      this.status = Status.initial,
      final List<VodModel> videos = const [],
      final List<VodModel> savedVideos = const [],
      this.page = 1,
      this.hasMorePages = false,
      this.error})
      : _categoryIds = categoryIds,
        _countryIds = countryIds,
        _releaseYears = releaseYears,
        _videos = videos,
        _savedVideos = savedVideos,
        super._();

  final List<int> _categoryIds;
  @override
  @JsonKey()
  List<int> get categoryIds {
    if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryIds);
  }

  final List<int> _countryIds;
  @override
  @JsonKey()
  List<int> get countryIds {
    if (_countryIds is EqualUnmodifiableListView) return _countryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countryIds);
  }

  final List<int> _releaseYears;
  @override
  @JsonKey()
  List<int> get releaseYears {
    if (_releaseYears is EqualUnmodifiableListView) return _releaseYears;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_releaseYears);
  }

  @override
  @JsonKey()
  final String search;
  @override
  @JsonKey()
  final Status status;
  final List<VodModel> _videos;
  @override
  @JsonKey()
  List<VodModel> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  final List<VodModel> _savedVideos;
  @override
  @JsonKey()
  List<VodModel> get savedVideos {
    if (_savedVideos is EqualUnmodifiableListView) return _savedVideos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedVideos);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool hasMorePages;
  @override
  final String? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VodFilterState(categoryIds: $categoryIds, countryIds: $countryIds, releaseYears: $releaseYears, search: $search, status: $status, videos: $videos, savedVideos: $savedVideos, page: $page, hasMorePages: $hasMorePages, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VodFilterState'))
      ..add(DiagnosticsProperty('categoryIds', categoryIds))
      ..add(DiagnosticsProperty('countryIds', countryIds))
      ..add(DiagnosticsProperty('releaseYears', releaseYears))
      ..add(DiagnosticsProperty('search', search))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('videos', videos))
      ..add(DiagnosticsProperty('savedVideos', savedVideos))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('hasMorePages', hasMorePages))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VodFilterStateImpl &&
            const DeepCollectionEquality()
                .equals(other._categoryIds, _categoryIds) &&
            const DeepCollectionEquality()
                .equals(other._countryIds, _countryIds) &&
            const DeepCollectionEquality()
                .equals(other._releaseYears, _releaseYears) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            const DeepCollectionEquality()
                .equals(other._savedVideos, _savedVideos) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.hasMorePages, hasMorePages) ||
                other.hasMorePages == hasMorePages) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categoryIds),
      const DeepCollectionEquality().hash(_countryIds),
      const DeepCollectionEquality().hash(_releaseYears),
      search,
      status,
      const DeepCollectionEquality().hash(_videos),
      const DeepCollectionEquality().hash(_savedVideos),
      page,
      hasMorePages,
      error);

  /// Create a copy of VodFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VodFilterStateImplCopyWith<_$VodFilterStateImpl> get copyWith =>
      __$$VodFilterStateImplCopyWithImpl<_$VodFilterStateImpl>(
          this, _$identity);
}

abstract class _VodFilterState extends VodFilterState {
  const factory _VodFilterState(
      {final List<int> categoryIds,
      final List<int> countryIds,
      final List<int> releaseYears,
      final String search,
      final Status status,
      final List<VodModel> videos,
      final List<VodModel> savedVideos,
      final int page,
      final bool hasMorePages,
      final String? error}) = _$VodFilterStateImpl;
  const _VodFilterState._() : super._();

  @override
  List<int> get categoryIds;
  @override
  List<int> get countryIds;
  @override
  List<int> get releaseYears;
  @override
  String get search;
  @override
  Status get status;
  @override
  List<VodModel> get videos;
  @override
  List<VodModel> get savedVideos;
  @override
  int get page;
  @override
  bool get hasMorePages;
  @override
  String? get error;

  /// Create a copy of VodFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VodFilterStateImplCopyWith<_$VodFilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
