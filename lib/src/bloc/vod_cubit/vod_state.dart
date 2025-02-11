part of 'vod_cubit.dart';

@freezed
class VodState with _$VodState {
  const factory VodState({
    @Default(Status.initial) Status status,
    @Default(Status.initial) Status categoryStatus,
    @Default(Status.initial) Status countryStatus,
    @Default({}) Map<String, List<VodModel>> videos,
    @Default([]) List<CountryModel> countries,
    @Default([]) List<CategoryModel> categories,
    @Default([]) List<int> savedVideos,
    String? error,
    String? categoryError,
    String? countryError,
    @Default(VodModel.empty) VodModel selectedVideo,
    @Default(null) int? selectedCategoryId,
    @Default(false) bool isPlaying,
  }) = _VodState;

  const VodState._();

  Iterable<VodModel> get getSavedVideos => videos.entries
      .expand((entry) => entry.value)
      .where(
        (e) => savedVideos.contains(e.id),
      )
      .toList();

  int getCategoryIdByName(String categoryName) {
    final Iterable<CategoryModel> filteredList = categories.where(
      (e) => e.title == categoryName,
    );

    return filteredList.first.id;
  }
}
