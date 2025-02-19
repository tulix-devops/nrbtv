import 'package:commons/commons.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/data/models/content/content_type_list_model.dart';
import 'package:nrbtv/src/data/params/search_params.dart';
import 'package:nrbtv/src/index.dart';

abstract class ContentRepository {
  Future<ResponseModel<ContentTypeListModel>> getTypeList();
  Future<ResponseModel<ContentListModel>> getPaginatedListById(
    int id,
    int? page,
    int? limit,
  );
  Future<ResponseModel<ContentListModel>> search(SearchParams params);

  Future<ResponseModel<ContentListModel>> getContentList(
      ContentListParams params);

  Future<ResponseModel<ContentListModel>> getRelatedContentById(
      int typeId, int contentId);
  Future<ResponseModel<ContentListModel>> getFeaturedList(int typeId);
  Future<ResponseModel<ContentTypeListModel>> getCategoryById(int typeId);
  Future<ResponseModel<ContentListModel>> getContentListByCategory(
      ContentListCategoryParams params);
}

final class ContentRepositoryImpl implements ContentRepository {
  ContentRepositoryImpl(
      {required ContentRemoteDataSource contentRemoteRepository})
      : _contentRemoteRepository = contentRemoteRepository;

  final ContentRemoteDataSource _contentRemoteRepository;

  @override
  Future<ResponseModel<ContentTypeListModel>> getTypeList() {
    return _contentRemoteRepository.getTypeList();
  }

  @override
  Future<ResponseModel<ContentListModel>> getPaginatedListById(
      int id, int? page, int? limit) {
    return _contentRemoteRepository.getPaginatedListById(id, page, limit);
  }

  @override
  Future<ResponseModel<ContentListModel>> search(SearchParams params) {
    return _contentRemoteRepository.search(params);
  }

  @override
  Future<ResponseModel<ContentTypeListModel>> getCategoryById(int typeId) {
    return _contentRemoteRepository.getCategoryById(typeId);
  }

  @override
  Future<ResponseModel<ContentListModel>> getContentList(
      ContentListParams params) {
    return _contentRemoteRepository.getContentList(params);
  }

  @override
  Future<ResponseModel<ContentListModel>> getFeaturedList(int typeId) {
    return _contentRemoteRepository.getFeaturedList(typeId);
  }

  @override
  Future<ResponseModel<ContentListModel>> getRelatedContentById(
      int typeId, int contentId) {
    return _contentRemoteRepository.getRelatedContentById(typeId, contentId);
  }

  @override
  Future<ResponseModel<ContentListModel>> getContentListByCategory(
      ContentListCategoryParams params) {
    return _contentRemoteRepository.getContentListByCategory(params);
  }
}
