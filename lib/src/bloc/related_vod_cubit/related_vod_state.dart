part of 'related_vod_cubit.dart';

@freezed
class RelatedVodState with _$RelatedVodState {
  const factory RelatedVodState({
    @Default(Status.initial) Status status,
    @Default([]) List<VodModel> relatedVodList,
    String? error,
  }) = _RelatedVodState;
}
