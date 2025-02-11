import 'package:commons/http/data/models/api_response_model.dart';
import 'package:nrbtv/src/data/data.dart';

abstract class VodRepository {
  List<int> savedVideoIds = <int>[];

  Future<ResponseModel<VodListModel>> list();
  Future<List<int>> getSavedVideoIdsFromStorage();
  Future<void> setSavedVideosIdsInStorage(List<int> videoIds);
  Future<ResponseModel<VodListModel>> getSavedVideos(SavedVideosParams params);
  Future<ResponseModel<void>> setSavedVideos(SavedVideosParams params);
  Future<ResponseModel<VodHomeListModel>> homePageList();
  Future<ResponseModel<VodListModel>> search(VodSearchParams params);
  Future<ResponseModel<CountryListModel>> countryList();
  Future<ResponseModel<CategoryListModel>> categoryList();
  Future<ResponseModel<VodListModel>> getRelatedVodList(int id);
}

final class VodRepositoryImpl implements VodRepository {
  VodRepositoryImpl({
    required VodRemoteDataSource vodRemoteDataSource,
    required VodLocalDataSource vodLocalDataSource,
  })  : _vodRemoteDataSource = vodRemoteDataSource,
        _vodLocalDataSource = vodLocalDataSource;

  final VodRemoteDataSource _vodRemoteDataSource;
  final VodLocalDataSource _vodLocalDataSource;

  @override
  List<int> savedVideoIds = <int>[];

  @override
  Future<ResponseModel<VodListModel>> getRelatedVodList(int id) {
    return _vodRemoteDataSource.getRelatedVodList(id);
  }

  @override
  Future<ResponseModel<VodHomeListModel>> homePageList() {
    return _vodRemoteDataSource.homePageList();
  }

  @override
  Future<ResponseModel<VodListModel>> list() {
    return _vodRemoteDataSource.list();
  }

  @override
  Future<ResponseModel<VodListModel>> getSavedVideos(SavedVideosParams params) {
    return _vodRemoteDataSource.getSavedVideos(params);
  }

  @override
  Future<ResponseModel<void>> setSavedVideos(SavedVideosParams params) {
    return _vodRemoteDataSource.setSavedVideos(params);
  }

  @override
  Future<ResponseModel<VodListModel>> search(VodSearchParams params) {
    return _vodRemoteDataSource.search(params);
  }

  @override
  Future<ResponseModel<CategoryListModel>> categoryList() {
    return _vodRemoteDataSource.categoryList();
  }

  @override
  Future<ResponseModel<CountryListModel>> countryList() {
    return _vodRemoteDataSource.countryList();
  }

  @override
  Future<List<int>> getSavedVideoIdsFromStorage() {
    return _vodLocalDataSource.getSavedVideoIds();
  }

  @override
  Future<void> setSavedVideosIdsInStorage(List<int> videoIds) {
    return _vodLocalDataSource.setSavedVideoIds(videoIds);
  }
}
