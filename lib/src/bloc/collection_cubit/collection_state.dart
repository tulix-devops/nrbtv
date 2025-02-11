part of 'collection_cubit.dart';

@freezed
class CollectionState with _$CollectionState {
  const CollectionState._();
  const factory CollectionState({
    @Default(Status.initial) Status status,
    @Default(1) int page,
    @Default(true) bool hasMorePages,
    @Default([]) List<ContentModel> contentList,
    @Default(false) bool isLoadingNextPage,
    @Default([]) List<CollectionModel> collectionListModel,
    @Default([]) List<CollectionModel> mainPageList,
  }) = _CollectionState;
}
