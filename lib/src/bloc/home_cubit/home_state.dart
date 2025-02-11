part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(Status.initial) Status status,
    @Default(null) ChannelModel? selectedChannel,
    @Default(false) bool isPlaying,
  }) = _HomeState;
}
