import 'package:commons/commons.dart';
import 'package:nrbtv/src/data/models/collection/collection_list_model.dart';
import 'package:nrbtv/src/data/models/content/content.dart';

final class CollectionRemoteDataSource with ApiCallHandler {
  const CollectionRemoteDataSource(this._client);

  final CustomHTTPClient _client;

  Future<ResponseModel<CollectionListModel>> getList() async {
    return handleApiCall<CollectionListModel>(
      url: APIList.collectionList,
      httpMethod: HttpMethod.get,
      dataMapper: CollectionListModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<ContentListModel>> getPaginatedCollection(
      int collectionId, int page, int limit) async {
    return handleApiCall(
      url:
          '${APIList.getPaginatedCollection(collectionId)}?page=$page&limit=$limit',
      httpMethod: HttpMethod.get,
      dataMapper: ContentListModel.fromJson,
      client: _client,
    );
  }
}
