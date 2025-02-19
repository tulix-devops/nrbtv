part of 'epg_cubit.dart';

@freezed
class EpgState with _$EpgState {
  const EpgState._();
  const factory EpgState({
    @Default(Status.initial) Status status,
    @Default(null) TvScheduleModel? selectedDvr,
    @Default(null) Map<String, List<TvScheduleModel>>? epgContent,
    @Default(null) LiveModel? live,
  }) = _EpgState;
}
