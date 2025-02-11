import 'package:equatable/equatable.dart';

import '../content/content_model.dart';

class CollectionModel extends Equatable {
  const CollectionModel({
    required this.contents,
    required this.id,
    required this.productId,
    required this.online,
    required this.title,
    required this.description,
    required this.thumbnail,
  });
  final int id;
  final int productId;
  final bool online;
  final String? title;
  final String? description;
  final String? thumbnail;
  final List<ContentModel>? contents;
  factory CollectionModel.fromJson(Map<String, dynamic> json) {
    final content = json;
    final List? contentList = content['contents'];
    return CollectionModel(
      id: content['id'] as int,
      productId: content['productId'] as int,
      online: content['online'] as bool,
      title: content['title'] as String,
      thumbnail: content['thumbnail'] as String?,
      description: json['description'] as String?,
      contents: contentList?.map((e) => ContentModel.fromJson(e)).toList(),
    );
  }
  static const empty = CollectionModel(
    contents: <ContentModel>[],
    id: 0,
    productId: 0,
    online: false,
    title: null,
    thumbnail: null,
    description: null,
  );

  @override
  List<Object?> get props =>
      [id, productId, online, title, description, thumbnail, contents];
}
