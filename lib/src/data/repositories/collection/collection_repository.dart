import 'package:commons/commons.dart';
import 'package:nrbtv/src/data/data_sources/collection/collection_remote_data_source.dart';
import 'package:nrbtv/src/data/models/collection/collection_list_model.dart';
import 'package:nrbtv/src/data/models/content/content.dart';

abstract class CollectionRepository {
  Future<ResponseModel<CollectionListModel>> getList();
  Future<ResponseModel<ContentListModel>> getPaginatedCollectionList({
    required int collectionId,
    required int page,
    int? limit,
  });
}

final class CollectionRepositoryImpl implements CollectionRepository {
  CollectionRepositoryImpl(
      {required CollectionRemoteDataSource collectionRemoteRepository})
      : _collectionRemoteRepository = collectionRemoteRepository;

  final CollectionRemoteDataSource _collectionRemoteRepository;

  @override
  Future<ResponseModel<CollectionListModel>> getList() {
    return _collectionRemoteRepository.getList();
  }

  @override
  Future<ResponseModel<ContentListModel>> getPaginatedCollectionList({
    required int collectionId,
    required int page,
    int? limit,
  }) {
    return _collectionRemoteRepository.getPaginatedCollection(
      collectionId,
      page,
      limit ?? 15,
    );
  }
}
