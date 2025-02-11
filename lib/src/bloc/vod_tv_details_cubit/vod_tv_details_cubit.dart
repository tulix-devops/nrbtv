import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vod_tv_details_state.dart';
part 'vod_tv_details_cubit.freezed.dart';

class VodTvDetailsCubit extends Cubit<VodTvDetailsState> {
  VodTvDetailsCubit() : super(const VodTvDetailsState());

  void setSeasonsSelected() {
    emit(state.copyWith(isSeasonBtnSelected: !state.isSeasonBtnSelected));
  }

  void reset() {
    emit(
      state.copyWith(
        isSeasonBtnSelected: false,
      ),
    );
  }
}
