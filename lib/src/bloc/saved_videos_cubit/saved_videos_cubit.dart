import 'package:commons/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nrbtv/src/data/data.dart';

part 'saved_videos_state.dart';
part 'saved_videos_cubit.freezed.dart';

class SavedVideosCubit extends Cubit<SavedVideosState> {
  SavedVideosCubit({
    required VodRepository vodRepository,
  })  : _vodRepository = vodRepository,
        super(const SavedVideosState());

  final VodRepository _vodRepository;

  Future<void> getSavedVideos() async {
    emit(state.copyWith(status: Status.loading));

    final List<int> videoIds =
        await _vodRepository.getSavedVideoIdsFromStorage();

    if (videoIds.isEmpty) {
      emit(state.copyWith(
        status: Status.success,
        videos: [],
      ));
      return;
    }

    final SavedVideosParams params = SavedVideosParams(
      videoIds: videoIds,
    );

    final ResponseModel<VodListModel> response =
        await _vodRepository.getSavedVideos(params);

    (switch (response) {
      SuccessModel<VodListModel>() => emit(
          state.copyWith(
            status: Status.success,
            videos: response.data.videos,
          ),
        ),
      FailureModel<VodListModel>() => emit(state.copyWith(
          status: Status.failure,
          error: response.message,
        )),
      AuthenticationFailureModel<VodListModel>() => emit(state.copyWith(
          status: Status.authenticationFailure,
          error: response.message,
        )),
      _ => emit(state.copyWith(
          status: Status.serverFailure,
          error: (response as dynamic).message,
        )),
    });
  }

  Future<void> setSavedVideos() async {
    emit(state.copyWith(status: Status.loading));

    final List<int> videoIds =
        await _vodRepository.getSavedVideoIdsFromStorage();

    if (videoIds.isEmpty) {
      emit(state.copyWith(
        status: Status.success,
        videos: [],
      ));
      return;
    }

    final SavedVideosParams params = SavedVideosParams(
      videoIds: videoIds,
    );

    final ResponseModel<void> response =
        await _vodRepository.setSavedVideos(params);

    (switch (response) {
      SuccessModel<void>() => emit(
          state.copyWith(
            status: Status.success,
          ),
        ),
      FailureModel<void>() => emit(state.copyWith(
          status: Status.failure,
          error: response.message,
        )),
      AuthenticationFailureModel<void>() => emit(state.copyWith(
          status: Status.authenticationFailure,
          error: response.message,
        )),
      _ => emit(state.copyWith(
          status: Status.serverFailure,
          error: (response as dynamic).message,
        )),
    });
  }
}
