import 'package:equatable/equatable.dart';
import 'package:nrbtv/src/data/models/content/content_type_model.dart';

class ContentTypeListModel extends Equatable {
  const ContentTypeListModel({
    required this.data,
  });

  final List<ContentTypeModel>? data;
  factory ContentTypeListModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"] as List<dynamic>?;
    return ContentTypeListModel(
      data: data != null
          ? data.map((e) => ContentTypeModel.fromJson(e)).toList()
          : <ContentTypeModel>[],
    );
  }
  static const empty = ContentTypeListModel(data: <ContentTypeModel>[]);

  @override
  List<Object?> get props => [data];
}
