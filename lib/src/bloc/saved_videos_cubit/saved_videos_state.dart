part of 'saved_videos_cubit.dart';

@freezed
class SavedVideosState with _$SavedVideosState {
  const factory SavedVideosState({
    @Default(Status.initial) Status status,
    String? error,
    @Default([]) List<VodModel> videos,
  }) = _SavedVideosState;
}
