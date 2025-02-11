import 'package:commons/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:nrbtv/src/data/data.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void setSelectedChannel(ChannelModel channel) {
    emit(state.copyWith(selectedChannel: channel, isPlaying: false));
  }

  void setIsPlaying(bool value) {
    emit(state.copyWith(isPlaying: value));
  }
}
