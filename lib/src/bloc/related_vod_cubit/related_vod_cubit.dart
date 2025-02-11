import 'package:commons/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nrbtv/src/data/data.dart';
part 'related_vod_state.dart';
part 'related_vod_cubit.freezed.dart';

class RelatedVodCubit extends Cubit<RelatedVodState> {
  RelatedVodCubit({
    required VodRepository vodRepository,
  })  : _vodRepository = vodRepository,
        super(const RelatedVodState());

  final VodRepository _vodRepository;

  Future<void> fetchRelatedContent(int vodId) async {
    emit(state.copyWith(status: Status.loading));
    final ResponseModel<VodListModel> response =
        await _vodRepository.getRelatedVodList(vodId);

    (switch (response) {
      SuccessModel<VodListModel>() => emit(
          state.copyWith(
            status: Status.success,
            relatedVodList: response.data.videos,
          ),
        ),
      FailureModel<VodListModel>() => emit(state.copyWith(
          status: Status.failure,
        )),
      AuthenticationFailureModel<VodListModel>() => emit(state.copyWith(
          status: Status.authenticationFailure,
        )),
      _ => emit(state.copyWith(
          status: Status.serverFailure,
          error: (response as dynamic).message,
        )),
    });
  }
}
