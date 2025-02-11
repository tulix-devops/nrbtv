import 'package:commons/commons.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/data/models/content/content_type_list_model.dart';
import 'package:nrbtv/src/data/params/params.dart';
import 'package:nrbtv/src/data/params/search_params.dart';

final class ContentRemoteDataSource with ApiCallHandler {
  const ContentRemoteDataSource(this._client);

  final CustomHTTPClient _client;

  Future<ResponseModel<ContentTypeListModel>> getTypeList() async {
    return handleApiCall<ContentTypeListModel>(
      url: APIList.contentTypeList,
      httpMethod: HttpMethod.get,
      dataMapper: ContentTypeListModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<ContentListModel>> getPaginatedListById(
    int id,
    int? page,
    int? limit,
  ) async {
    String url = APIList.getByTypeId(id);
    if (page != null) {
      url += '?page=$page';
    }
    if (limit != null) {
      url += page != null ? '&limit=$limit' : '?limit=$limit';
    }

    return handleApiCall<ContentListModel>(
      url: url,
      httpMethod: HttpMethod.get,
      dataMapper: ContentListModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<ContentListModel>> getRelatedContentById(
      int typeId, int contentId) {
    return handleApiCall<ContentListModel>(
      url: APIList.getRelatedContentById(typeId, contentId),
      httpMethod: HttpMethod.get,
      dataMapper: ContentListModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<ContentListModel>> getContentList(
      ContentListParams params) async {
    String url =
        "${APIList.contentList(typeId: params.typeId)}?page=${params.page}";

    return handleApiCall<ContentListModel>(
      url: url,
      httpMethod: HttpMethod.get,
      dataMapper: ContentListModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<ContentListModel>> getContentListByCategory(
      ContentListCategoryParams params) async {
    return handleApiCall<ContentListModel>(
      url: APIList.contentListByCategory(
          categoryId: params.categoryId, typeId: params.typeId),
      httpMethod: HttpMethod.get,
      dataMapper: ContentListModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<ContentListModel>> getFeaturedList(int typeId) async {
    String url = APIList.featureList(typeId: typeId);
    return handleApiCall<ContentListModel>(
      url: url,
      httpMethod: HttpMethod.get,
      dataMapper: ContentListModel.featureFromJson,
      client: _client,
    );
  }

  Future<ResponseModel<ContentTypeListModel>> getCategoryById(int typeId) {
    String url = APIList.getCategoriesById(typeId: typeId);

    return handleApiCall<ContentTypeListModel>(
      url: url,
      httpMethod: HttpMethod.get,
      dataMapper: ContentTypeListModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<ContentListModel>> search(SearchParams params) {
    final Map<String, dynamic> queryParams = <String, dynamic>{
      if (params.categoryIds != null)
        'categoryIds': params.categoryIds!.join(','),
      if (params.countryIds != null) 'countryIds': params.countryIds!.join(','),
      'limit': params.limit != null ? params.limit.toString() : 15.toString(),
      if (params.releaseYears != null)
        'releaseYears': params.releaseYears!.join(','),
      if (params.search != null) 'search': params.search,
      if (params.page != null) 'page': params.page.toString(),
      'typeId': params.typeId.toString(),
    };

    final Uri url =
        Uri.parse(APIList.search).replace(queryParameters: queryParams);
    return handleApiCall<ContentListModel>(
      url: url.toString(),
      httpMethod: HttpMethod.get,
      dataMapper: ContentListModel.fromJson,
      client: _client,
    );
  }
}
