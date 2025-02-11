import 'dart:convert';

import 'package:commons/commons.dart';
import 'package:nrbtv/src/data/data.dart';

final class VodRemoteDataSource with ApiCallHandler {
  VodRemoteDataSource(this._client);

  final CustomHTTPClient _client;

  Future<ResponseModel<VodListModel>> getRelatedVodList(int vodId) {
    return handleApiCall<VodListModel>(
      url: "${APIList.relatedVodList}/$vodId",
      httpMethod: HttpMethod.get,
      dataMapper: VodListModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<VodHomeListModel>> homePageList() {
    return handleApiCall<VodHomeListModel>(
      url: APIList.homePageList,
      httpMethod: HttpMethod.get,
      dataMapper: VodHomeListModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<VodListModel>> list() {
    return handleApiCall<VodListModel>(
      url: APIList.vodList,
      httpMethod: HttpMethod.get,
      dataMapper: VodListModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<VodListModel>> getSavedVideos(SavedVideosParams params) {
    return handleApiCall<VodListModel>(
      url: APIList.savedVideos,
      httpMethod: HttpMethod.get,
      body: jsonEncode(params.toJson()),
      dataMapper: VodListModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<void>> setSavedVideos(SavedVideosParams params) {
    return handleApiCall<void>(
      url: APIList.saveVideo,
      httpMethod: HttpMethod.post,
      body: jsonEncode(params.toJson()),
      dataMapper: VodListModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<VodListModel>> search(VodSearchParams params) {
    return handleApiCall<VodListModel>(
      url: "${APIList.vodSearch}?page=${params.page}",
      httpMethod: HttpMethod.post,
      body: jsonEncode(params.toJson()),
      dataMapper: VodListModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<CategoryListModel>> categoryList() {
    return handleApiCall<CategoryListModel>(
      url: APIList.categoryList,
      httpMethod: HttpMethod.get,
      dataMapper: CategoryListModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<CountryListModel>> countryList() {
    return handleApiCall<CountryListModel>(
      url: APIList.countryList,
      httpMethod: HttpMethod.get,
      dataMapper: CountryListModel.fromJson,
      client: _client,
    );
  }
}
