part of 'channel_cubit.dart';

@freezed
class ChannelState with _$ChannelState {
  const ChannelState._();

  const factory ChannelState({
    @Default(Status.initial) Status status,
    @Default([]) List<ChannelModel> channels,
    @Default(null) ChannelModel? selectedChannel,
    String? error,
  }) = _ChannelState;

  List<ChannelModel> relatedChannels(ChannelModel channel) {
    return channels.where((item) => item.id != channel.id).toList();
  }
}
