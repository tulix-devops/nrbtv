part of 'vod_tv_details_cubit.dart';

@freezed
class VodTvDetailsState with _$VodTvDetailsState {
  const factory VodTvDetailsState({
    @Default(false) bool isSeasonBtnSelected,
  }) = _VodTvDetailsState;

  const VodTvDetailsState._();
}
