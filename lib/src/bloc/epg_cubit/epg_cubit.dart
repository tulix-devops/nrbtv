import 'package:commons/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nrbtv/src/data/models/content/live_model.dart';
import 'package:nrbtv/src/data/models/content/schedule_model.dart';
import 'package:nrbtv/src/data/models/content/tv_schedule_model.dart';
import 'package:nrbtv/src/data/repositories/epg/epg_repository.dart';

part 'epg_state.dart';
part 'epg_cubit.freezed.dart';

class EpgCubit extends Cubit<EpgState> {
  EpgCubit({
    required EpgRepository repo,
  })  : _repo = repo,
        super(const EpgState());

  final EpgRepository _repo;

  Future<void> getEpg(int week) async {
    emit(state.copyWith(status: Status.loading));
    final res = await _repo.getEpg(week);

    (switch (res) {
      SuccessModel<ScheduleModel>() => {
          emit(
            state.copyWith(
              epgContent: res.data.data,
              selectedDvr: res.data.data.values.elementAt(5).first,
              status: Status.success,
            ),
          ),
        },
      FailureModel<ScheduleModel>() => {
          emit(state.copyWith(
            status: Status.failure,
          )),
        },
      AuthenticationFailureModel<ScheduleModel>() => {
          emit(state.copyWith(
            status: Status.authenticationFailure,
          ))
        },
      _ => {
          emit(state.copyWith(
            status: Status.serverFailure,
          ))
        },
    });
  }

  void setCurrentDvr(TvScheduleModel dvr) {
    if (state.selectedDvr != dvr) {
      emit(state.copyWith(selectedDvr: dvr));
    }
  }

  Future<void> getLive() async {
    emit(state.copyWith(status: Status.loading));

    final res = await _repo.getLive();

    (switch (res) {
      SuccessModel<LiveModel>() => {
          print(res.data),
          emit(
            state.copyWith(
              live: res.data,
              status: Status.success,
            ),
          ),
          print(res.data),
        },
      FailureModel<LiveModel>() => {
          emit(state.copyWith(
            status: Status.failure,
          )),
        },
      AuthenticationFailureModel<LiveModel>() => {
          emit(state.copyWith(
            status: Status.authenticationFailure,
          ))
        },
      _ => {
          emit(state.copyWith(
            status: Status.serverFailure,
          ))
        },
    });
  }
}
