import 'package:commons/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nrbtv/src/data/data.dart';

part 'channel_state.dart';
part 'channel_cubit.freezed.dart';

class ChannelCubit extends Cubit<ChannelState> {
  ChannelCubit({
    required ChannelRepository channelRepository,
  })  : _channelRepository = channelRepository,
        super(const ChannelState());

  final ChannelRepository _channelRepository;

  Future<void> init() async {
    await _getChannels();
  }

  Future<void> _getChannels() async {
    emit(state.copyWith(status: Status.loading));

    final ResponseModel<ChannelListModel> response =
        await _channelRepository.getChannels();

    (switch (response) {
      SuccessModel<ChannelListModel>() => emit(
          state.copyWith(
            status: Status.success,
            channels: response.data.channels,
          ),
        ),
      FailureModel<ChannelListModel>() => emit(state.copyWith(
          status: Status.failure,
          error: response.message,
        )),
      AuthenticationFailureModel<ChannelListModel>() => emit(state.copyWith(
          status: Status.authenticationFailure,
          error: response.message,
        )),
      _ => emit(state.copyWith(
          status: Status.serverFailure,
          error: (response as dynamic).message,
        )),
    });
  }

  void selectChannel(ChannelModel channel) {
    emit(state.copyWith(selectedChannel: channel));
  }
}
