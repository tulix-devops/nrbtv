import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:local_storage/local_storage.dart';

class ContentLocalDataSource {
  final LocalStorage _localStorage;
  const ContentLocalDataSource(this._localStorage);

  Future<void> storeContentList(
      Map<String, List<ContentModel>> contentList) async {
    final jsonMap = contentList.map((key, value) => MapEntry(
          key,
          value.map((content) => content.toJson()).toList(),
        ));
    final existingContent =
        await _localStorage.get<Map<String, dynamic>>(CacheKeys.contentList);

    await _localStorage.store<Map<String, dynamic>>(
        CacheKeys.contentList, {...?existingContent, ...jsonMap});
  }

  Future<Map<String, List<ContentModel>>?> getContentList() async {
    try {
      final contentList =
          await _localStorage.get<Map<String, dynamic>>(CacheKeys.contentList);

      return contentList?.map((key, value) => MapEntry(
            key,
            (value as List<dynamic>)
                .map((item) =>
                    ContentModel.fromJson(item as Map<String, dynamic>))
                .toList(),
          ));
    } catch (e) {
      return null;
    }
  }

  Future<DateTime?> getCacheTimestamp() async {
    final timestampString =
        await _localStorage.get<String>(CacheKeys.cacheTimestamp);
    if (timestampString != null) {
      return DateTime.tryParse(timestampString);
    }
    return null;
  }
}
