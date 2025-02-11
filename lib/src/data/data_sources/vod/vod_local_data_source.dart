import 'package:local_storage/local_storage.dart';

class VodLocalDataSource {
  final LocalStorage _localStorage;
  const VodLocalDataSource(this._localStorage);

  Future<List<int>> getSavedVideoIds() async {
    final List<int> savedVideos =
        await _localStorage.get<List<int>>(CacheKeys.savedList) ?? <int>[];

    return savedVideos;
  }

  Future<void> setSavedVideoIds(List<int> savedVideos) async {
    return _localStorage.store<List<int>>(CacheKeys.savedList, savedVideos);
  }
}
