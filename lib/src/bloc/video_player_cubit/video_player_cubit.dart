import 'dart:async';

import 'package:commons/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nrbtv/src/data/data.dart';
import 'package:nrbtv/src/data/models/ad_model/ad_model.dart';
import 'package:nrbtv/src/data/models/content/content.dart';

part 'video_player_state.dart';
part 'video_player_cubit.freezed.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  VideoPlayerCubit({
    required GetAuthTokenUseCase getAuthTokenUseCase,
    required AdRepository adRepository,
  })  : _adRepository = adRepository,
        _getAuthTokenUseCase = getAuthTokenUseCase,
        super(const VideoPlayerState());

  Timer? _visibilityTimer;
  final AdRepository _adRepository;
  final GetAuthTokenUseCase _getAuthTokenUseCase;
  void controlVisibility() {
    if (state.isVisible) {
      emit(state.copyWith(isVisible: false));
      return;
    }

    handleVisibility();
  }

  Future<void> checkAdStatus() async {
    final token = await _getAuthTokenUseCase();
    if (token == null) return;
    final result = await _adRepository.checkCustomerAdStatus(token);
    (switch (result) {
      SuccessModel<AdModel>() => emit(
          state.copyWith(adModel: result.data),
        ),
      FailureModel<AdModel>() => emit(state.copyWith(status: Status.failure)),
      ValidationFailureModel<AdModel>() =>
        emit(state.copyWith(status: Status.failure)),
      ModelNotFoundFailureModel<AdModel>() =>
        emit(state.copyWith(status: Status.failure)),
      _ => emit(state.copyWith(status: Status.failure)),
    });
  }

  String formatDuration(Duration? duration) {
    if (duration != null) {
      String minutes = duration.inMinutes.toString().padLeft(2, '0');
      String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
      return '$minutes:$seconds';
    }
    return '00:00';
  }

  Future<void> updateAdStatus(
      ({int contentId, int eventTypeId}) eventParams) async {
    final token = await _getAuthTokenUseCase();
    if (token == null) return;
    final params = AdLogEventParams(
      adId: state.adModel!.ad.id,
      contentId: eventParams.contentId,
      eventTypeId: eventParams.eventTypeId,
      token: token,
    );
    await _adRepository.logAdEvent(params);
  }

  void changeVisibility(bool visibility) {
    _visibilityTimer?.cancel();
    emit(state.copyWith(isVisible: visibility));
  }

  Future<void> fullScreen() async {
    emit(state.copyWith(isVisible: false));
    await Future.delayed(const Duration(milliseconds: 450));
    emit(state.copyWith(isFullScreen: !state.isFullScreen));
  }

  void setIsPlaying(bool isPlaying) {
    emit(state.copyWith(isPlaying: isPlaying));
    handleVisibility();
  }

  void lockScreen() {
    emit(state.copyWith(isLocked: !state.isLocked));
    handleVisibility();
  }

  void setVolume(double volume) {
    emit(state.copyWith(
        videoVolume: (currentVolume: volume, previousVolume: volume)));
  }

  void muteVideo() {
    double newCurrentVolume =
        !state.isMuted ? 0.0 : state.videoVolume.previousVolume;
    emit(state.copyWith(isMuted: !state.isMuted, videoVolume: (
      currentVolume: newCurrentVolume,
      previousVolume: state.videoVolume.previousVolume
    )));

    handleVisibility();
  }

  void videoSeekForwardTrigger(bool status) {
    emit(state.copyWith(videoIsSeekingForward: status));
  }

  void setVideo(ContentModel video) {
    emit(state.copyWith(video: video));
  }

  void videoSeekBackWardTrigger(bool status) {
    emit(state.copyWith(videoIsRewindSeeking: status));
  }

  void handleVisibility() {
    _visibilityTimer?.cancel();

    emit(state.copyWith(isVisible: true));

    _visibilityTimer = Timer(const Duration(seconds: 6), () {
      emit(state.copyWith(isVisible: false));
    });
  }

  void reset() {
    emit(
      state.copyWith(
        isFullScreen: false,
        isLocked: false,
        isPlaying: true,
        isMuted: false,
        isVisible: false,
        status: Status.initial,
        isAdDone: false,
      ),
    );
  }

  void selectSpeed(int index) {
    emit(state.copyWith(selectedSpeed: index));
  }

  void setPreviousVolume(double volume) {
    emit(state.copyWith(videoVolume: (
      currentVolume: state.videoVolume.currentVolume,
      previousVolume: volume
    )));
  }

  void setFullScreen({bool? isFullScreen}) {
    emit(state.copyWith(isFullScreen: isFullScreen ?? true));
  }

  void setCurrentVolume(double volume) {
    emit(state.copyWith(videoVolume: (
      currentVolume: volume,
      previousVolume: state.videoVolume.previousVolume
    )));
  }

  void setAdDone() {
    emit(state.copyWith(isAdDone: true));
  }
}
