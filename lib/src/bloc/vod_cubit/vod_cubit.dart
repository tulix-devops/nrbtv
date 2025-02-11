import 'package:commons/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nrbtv/src/data/data.dart';

part 'vod_state.dart';
part 'vod_cubit.freezed.dart';

class VodCubit extends Cubit<VodState> {
  VodCubit({
    required VodRepository vodRepository,
  })  : _vodRepository = vodRepository,
        super(const VodState()) {
    init();
  }

  final VodRepository _vodRepository;

  Future<void> fetchCategoryList() async {
    emit(state.copyWith(categoryStatus: Status.loading));

    final ResponseModel<CategoryListModel> response =
        await _vodRepository.categoryList();

    (switch (response) {
      SuccessModel<CategoryListModel>() => emit(
          state.copyWith(
            categoryStatus: Status.success,
            categories: response.data.categories,
          ),
        ),
      FailureModel<CategoryListModel>() => emit(state.copyWith(
          categoryStatus: Status.failure,
          categoryError: response.message,
        )),
      AuthenticationFailureModel<CategoryListModel>() => emit(state.copyWith(
          categoryStatus: Status.authenticationFailure,
          categoryError: response.message,
        )),
      _ => emit(state.copyWith(
          categoryStatus: Status.serverFailure,
          categoryError: (response as dynamic).message,
        )),
    });
  }

  void init() async {
    final List<int> savedVideos =
        await _vodRepository.getSavedVideoIdsFromStorage();

    emit(state.copyWith(savedVideos: savedVideos));
  }

  void saveVideo(VodModel video) async {
    final List<int> savedVideos = state.savedVideos.contains(video.id)
        ? state.savedVideos.where((e) => e != video.id).toList()
        : [...state.savedVideos, video.id];

    await _vodRepository.setSavedVideosIdsInStorage(savedVideos);

    await _vodRepository.setSavedVideos(
      SavedVideosParams(
        videoIds: savedVideos,
      ),
    );
    emit(state.copyWith(savedVideos: savedVideos));
  }

  void setSelectedCategoryId(int categoryId) {
    emit(state.copyWith(selectedCategoryId: categoryId));
  }

  void resetSelectedCategoryId() {
    emit(state.copyWith(selectedCategoryId: null));
  }

  Future<void> fetchCountryList() async {
    emit(state.copyWith(countryStatus: Status.loading));

    final ResponseModel<CountryListModel> response =
        await _vodRepository.countryList();

    (switch (response) {
      SuccessModel<CountryListModel>() => emit(
          state.copyWith(
            countryStatus: Status.success,
            countries: response.data.countries,
          ),
        ),
      FailureModel<CountryListModel>() => emit(state.copyWith(
          countryStatus: Status.failure,
          countryError: response.message,
        )),
      AuthenticationFailureModel<CountryListModel>() => emit(state.copyWith(
          countryStatus: Status.authenticationFailure,
          countryError: response.message,
        )),
      _ => emit(state.copyWith(
          countryStatus: Status.serverFailure,
          countryError: (response as dynamic).message,
        )),
    });
  }

  Future<void> fetchHomeList() async {
    emit(state.copyWith(status: Status.loading));

    final ResponseModel<VodHomeListModel> response =
        await _vodRepository.homePageList();

    (switch (response) {
      SuccessModel<VodHomeListModel>() => emit(
          state.copyWith(
            status: Status.success,
            videos: response.data.videos,
          ),
        ),
      FailureModel<VodHomeListModel>() => emit(state.copyWith(
          status: Status.failure,
          error: response.message,
        )),
      AuthenticationFailureModel<VodHomeListModel>() => emit(state.copyWith(
          status: Status.authenticationFailure,
          error: response.message,
        )),
      _ => emit(state.copyWith(
          status: Status.serverFailure,
          error: (response as dynamic).message,
        )),
    });
  }

  void setSelectedContent(VodModel channel) {
    emit(state.copyWith(selectedVideo: channel, isPlaying: false));
  }

  void setIsPlaying(bool value) {
    emit(state.copyWith(isPlaying: value));
  }

  void reset() {
    emit(
      state.copyWith(
        isPlaying: false,
      ),
    );
  }
}
