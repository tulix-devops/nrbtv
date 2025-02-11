import 'package:commons/commons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nrbtv/src/data/data.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/data/params/search_params.dart';

part 'search_filter_event.dart';

part 'search_filter_state.dart';

part 'search_filter_bloc.freezed.dart';

const _searchDebounceDuration = Duration(milliseconds: 200);
const _duration = Duration(milliseconds: 50);

extension FirstWhereExt<T> on List<T> {
  /// The first element satisfying [test], or `null` if there are none.
  T? firstWhereOrNull(bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class SearchFilterBloc extends Bloc<SearchFilterEvent, SearchFilterState> {
  SearchFilterBloc({required ContentRepository contentRepository})
      : _contentRepository = contentRepository,
        super(const SearchFilterState()) {
    on<InitializeWithFilter>(
      (event, emit) => _initializeWithFilter(event.categoryId, emit),
    );
    on<CategoryFilterChanged>(
        (event, emit) => _changeCategoryFilter(
              event.categoryId,
              emit,
            ),
        transformer: debounce(_duration));

    on<YearFilterChanged>((event, emit) => _changeYearFilter(event.year, emit), transformer: debounce(_duration));

    on<CountryFilterChanged>((event, emit) => _changeCountryFilter(event.countryId, emit),
        transformer: debounce(_duration));

    on<SearchFilterChanged>((event, emit) => _changeSearchFilter(event.keyword, emit),
        transformer: debounce(_searchDebounceDuration));

    on<Initialize>((event, emit) => _initialize(event, emit));
    on<ChangePage>((event, emit) => _changePage(emit));

    on<FilterRemoved>(
      (event, emit) => _filterRemoved(event, emit),
      transformer: debounce(_duration),
    );

    on<ResetFilter>(
      (event, emit) => _resetFilter(emit),
      transformer: debounce(_duration),
    );

    on<ApplyFilter>((event, emit) => _fetchVideos(emit));

    on<UndoFilter>((event, emit) => _undoFilter(event, emit));
  }
  final ContentRepository _contentRepository;

  void _changeCountryFilter(int countryId, Emitter<SearchFilterState> emit) {
    // if is All filter applied, remove all other filters
    if (countryId == 0 && !listEquals(state.countryIds, [0])) {
      emit(state.copyWith(countryIds: [countryId]));
      return;
    }

    if (countryId == 0 && listEquals(state.countryIds, [0])) {
      emit(state.copyWith(countryIds: []));
      return;
    }

    if (!state.countryIds.contains(countryId)) {
      emit(
        state.copyWith(
          countryIds: [
            ...state.countryIds,
            countryId,
          ]..remove(0),
        ),
      );

      return;
    }

    final List<int> countryIds = state.countryIds.where((e) => e != countryId).toList();

    emit(state.copyWith(countryIds: countryIds));
  }

  Future<void> _initializeWithFilter(
    int categoryId,
    Emitter<SearchFilterState> emit,
  ) async {
    _changeCategoryFilter(categoryId, emit);

    await _fetchVideos(
      emit,
    );
  }

  void _changeCategoryFilter(int categoryId, Emitter<SearchFilterState> emit) {
    final List<int> categoryIds = !state.categoryIds.contains(categoryId)
        ? [...state.categoryIds, categoryId]
        : [...state.categoryIds.where((e) => e != categoryId)];

    emit(state.copyWith(categoryIds: categoryIds, videos: [], page: 1));
  }

  void _changePage(Emitter<SearchFilterState> emit) {
    int page = state.page + 1;
    emit(state.copyWith(page: page));
  }

  void _changeYearFilter(
    int year,
    Emitter<SearchFilterState> emit,
  ) {
    final List<int> releaseYears = !state.releaseYears.contains(year)
        ? [...state.releaseYears, year]
        : state.releaseYears.where((e) => e != year).toList();

    emit(state.copyWith(releaseYears: releaseYears));
  }

  void _undoFilter(UndoFilter event, Emitter<SearchFilterState> emit) async {
    emit(
      state.copyWith(categoryIds: event.initialCategories, countryIds: event.initialCountries),
    );
  }

  void _resetFilter(Emitter<SearchFilterState> emit) async {
    if (!state.isFilterActive) {
      return;
    }

    emit(
      state.copyWith(
        categoryIds: [],
        countryIds: [],
        releaseYears: [],
        search: '',
        page: 1,
      ),
    );

    _fetchVideos(
      emit,
    );
  }

  void _filterRemoved(FilterRemoved event, Emitter<SearchFilterState> emit) async {
    final int? categoryId = event.categories.where((e) => e.title == event.filterName).firstOrNull?.id;

    final int? countryId = event.countries.where((e) => e.name == event.filterName).firstOrNull?.id;

    if (categoryId != null) {
      emit(state.copyWith(
        categoryIds: state.categoryIds.where((e) => e != categoryId).toList(),
      ));

      await _fetchVideos(
        emit,
      );

      return;
    }

    if (countryId != null) {
      emit(
        state.copyWith(
          countryIds: state.countryIds.where((e) => e != countryId).toList(),
        ),
      );

      await _fetchVideos(
        emit,
      );

      return;
    }

    if (state.releaseYears.contains(int.parse(event.filterName))) {
      emit(state.copyWith(
        releaseYears: state.releaseYears.where((e) => e != int.parse(event.filterName)).toList(),
      ));

      await _fetchVideos(
        emit,
      );
      return;
    }
  }

  Future<void> _changeSearchFilter(String search, Emitter<SearchFilterState> emit) async {
    emit(
      state.copyWith(
        search: search,
        page: 1,
      ),
    );

    await _fetchVideos(
      emit,
    );
  }

  Future<void> _initialize(Initialize event, Emitter<SearchFilterState> emit) async {
    await _fetchVideos(emit);
  }

  Future<void> _fetchVideos(Emitter<SearchFilterState> emit) async {
    final SearchParams params = SearchParams(
      categoryIds: state.categoryIds,
      countryIds: state.countryIds,
      releaseYears: state.releaseYears,
      search: state.search,
      page: state.page,
      typeId: state.contentType.value,
    );

    emit(
      state.copyWith(status: Status.loading),
    );

    final ResponseModel<ContentListModel> response = await _contentRepository.search(params);

    (switch (response) {
      PaginatedModel<ContentListModel>() => {
          emit(
            state.copyWith(
              status: Status.success,
              videos: [
                if (response.meta.currentPage != 1) ...state.videos,
                ...response.data.contents!,
              ],
              hasMorePages: response.meta.currentPage < response.meta.lastPage,
              page: response.meta.currentPage,
            ),
          ),
        },
      FailureModel<ContentListModel>() => emit(state.copyWith(
          status: Status.failure,
          error: response.message,
        )),
      AuthenticationFailureModel<ContentListModel>() => emit(state.copyWith(
          status: Status.authenticationFailure,
          error: response.message,
        )),
      _ => emit(state.copyWith(
          status: Status.serverFailure,
          error: (response as dynamic).message,
        )),
    });

    print(state.error);
  }
}
