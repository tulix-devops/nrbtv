import 'package:equatable/equatable.dart';

import 'content_model.dart';

class ContentListModel extends Equatable {
  const ContentListModel({
    this.contents,
    this.featureList,
  });
  final List<ContentModel>? contents;
  final Map<String, List<ContentModel>>? featureList;

  factory ContentListModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    if (data == null) return const ContentListModel(contents: []);

    return ContentListModel(
      contents:
          data.map<ContentModel>((e) => ContentModel.fromJson(e)).toList(),
    );
  }

  factory ContentListModel.featureFromJson(Map<String, dynamic> json) {
    final data = json['data'];
    if (data == null) return const ContentListModel(featureList: {});
    final mediaItemsByGenre = <String, List<ContentModel>>{};
    data.forEach((key, value) {
      mediaItemsByGenre[key] =
          (value as List).map((item) => ContentModel.fromJson(item)).toList();
    });

    return ContentListModel(featureList: mediaItemsByGenre);
  }

  @override
  List<Object?> get props => [
        contents,
      ];

  static const empty = ContentListModel(contents: []);
}
