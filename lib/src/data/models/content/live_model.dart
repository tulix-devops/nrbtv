import 'package:equatable/equatable.dart';
import 'package:nrbtv/src/data/models/content/content.dart';

class LiveModel extends Equatable {
  final int id;
  final int statusId;
  final int productId;
  final int? parentId;
  final String type;
  final int typeId;
  final String title;
  final String description;
  final String? details;
  final dynamic product;
  final dynamic genres;
  final dynamic duration;
  final List<dynamic> attributes;
  final ImagesModel images;
  final SourceModel sources;

  const LiveModel({
    required this.id,
    required this.statusId,
    required this.productId,
    this.parentId,
    required this.type,
    required this.typeId,
    required this.title,
    required this.description,
    this.details,
    this.product,
    this.genres,
    this.duration,
    required this.attributes,
    required this.images,
    required this.sources,
  });

  factory LiveModel.fromJson(Map<String, dynamic> json) {
    return LiveModel(
      id: json['id'],
      statusId: json['statusId'],
      productId: json['productId'],
      parentId: json['parentId'],
      type: json['type'],
      typeId: json['typeId'],
      title: json['title'],
      description: json['description'],
      details: json['details'],
      product: json['product'],
      genres: json['genres'],
      duration: json['duration'],
      attributes: List<dynamic>.from(json['attributes'] ?? []),
      images: ImagesModel.fromJson(json['images']),
      sources: SourceModel.fromJson(json['sources']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        statusId,
        productId,
        parentId,
        type,
        typeId,
        title,
        description,
        details,
        product,
        genres,
        duration,
        attributes,
        images,
        sources,
      ];
}
