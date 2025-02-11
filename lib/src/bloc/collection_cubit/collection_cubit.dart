import 'package:commons/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nrbtv/src/data/models/collection/collection_list_model.dart';
import 'package:nrbtv/src/data/models/collection/collection_model.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/data/repositories/repositories.dart';

part 'collection_state.dart';
part 'collection_cubit.freezed.dart';

class CollectionCubit extends Cubit<CollectionState> {
  CollectionCubit({
    required CollectionRepository collectionRepository,
  })  : _collectionRepository = collectionRepository,
        super(const CollectionState());

  final CollectionRepository _collectionRepository;

  void getCollection() async {
    emit(state.copyWith(status: Status.loading));

    final response = await _collectionRepository.getList();

    (switch (response) {
      PaginatedModel<CollectionListModel>() => {
          emit(state.copyWith(
            collectionListModel: response.data.data,
            status: Status.success,
          )),
        },
      FailureModel<CollectionListModel>() => emit(state.copyWith(
          status: Status.failure,
        )),
      _ => emit(
          state.copyWith(
            status: Status.serverFailure,
          ),
        ),
    });
  }

  void reset() {
    emit(
      state.copyWith(
        status: Status.initial,
        contentList: [],
        hasMorePages: true,
        page: 1,
        isLoadingNextPage: false,
      ),
    );
  }

  void nextPage() {
    emit(
      state.copyWith(
        status: Status.loading,
        page: state.page + 1,
      ),
    );
  }

  Future<void> fetchContent({
    required int collectionId,
    required int limit,
  }) async {
    emit(
      state.copyWith(status: Status.loading),
    );
    final response = await _collectionRepository.getPaginatedCollectionList(
      collectionId: collectionId,
      page: state.page,
      limit: limit,
    );

    (switch (response) {
      PaginatedModel<ContentListModel>() => {
          if (response.data.contents != null)
            {
              emit(
                state.copyWith(
                  status: Status.success,
                  contentList: [
                    ...state.contentList,
                    ...response.data.contents!
                  ],
                  hasMorePages: response.links.next != null,
                ),
              ),
            },
        },
      FailureModel<ContentListModel>() => emit(state.copyWith(
          status: Status.failure,
        )),
      _ => emit(
          state.copyWith(
            status: Status.serverFailure,
          ),
        ),
    });
  }
}
