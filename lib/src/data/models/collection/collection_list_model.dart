import 'package:nrbtv/src/data/models/collection/collection_model.dart';

class CollectionListModel {
  final List<CollectionModel> data;
  const CollectionListModel({required this.data});

  factory CollectionListModel.fromJson(Map<String, dynamic> json) {
    return CollectionListModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => CollectionModel.fromJson(e))
          .toList(),
    );
  }
  static const empty = CollectionListModel(data: []);
}
