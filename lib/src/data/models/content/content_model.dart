import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:nrbtv/src/data/models/content/seasons_model.dart';

import 'content.dart';

class ContentModel extends Equatable {
  const ContentModel({
    required this.id,
    required this.parentId,
    required this.typeId,
    required this.type,
    required this.statusId,
    required this.productId,
    required this.countryId,
    required this.title,
    required this.description,
    required this.attributes,
    required this.details,
    required this.seo,
    required this.images,
    required this.sources,
    required this.seasons,
  });
  final int id;
  final int? parentId;
  final int? typeId;
  final String? type;
  final int? statusId;
  final int? productId;
  final int? countryId;
  final String title;
  final String? description;
  final Map<String, String?>? attributes;
  final DetailsModel? details;
  final SeoModel? seo;
  final ImagesModel images;
  final SourceModel sources;
  final Map<int, SeasonModel>? seasons;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parentId': parentId,
      'typeId': typeId,
      'type': type,
      'statusId': statusId,
      'productId': productId,
      'countryId': countryId,
      'title': title,
      'description': description,
      'attributes': attributes,
      'details': details?.toJson(),
      'seo': seo?.toJson(),
      'images': images.toJson(),
      'sources': sources.toJson(),
      'seasons': seasons?.map((key, episode) {
        return MapEntry(key, episode.toJson());
      })
    };
  }

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    final attribute = json['attributes'];

    Map<String, String?>? attributesMap;

    if (attribute is Map<String, dynamic> && attribute.keys.isNotEmpty) {
      attributesMap = attribute.map((key, value) {
        return MapEntry(key, value as String?);
      });
    } else {
      attributesMap = null;
    }
    final seasonJson = json['seasons'] as Map<String, dynamic>?;
    return ContentModel(
      id: json['id'] as int,
      parentId: (json['parentId'] as int?)?.toInt(),
      typeId: (json['typeId'] as int?)?.toInt(),
      type: json['type'] as String?,
      statusId: (json['statusId'] as int?)?.toInt(),
      productId: (json['productId'] as int?)?.toInt(),
      countryId: (json['countryId'] as int?)?.toInt(),
      title: json['title'] as String,
      description: json['description'] != null
          ? Bidi.stripHtmlIfNeeded(json['description']) as String?
          : null,
      attributes: attributesMap,
      details: json['details'] != null
          ? DetailsModel.fromJson(json['details'])
          : null,
      seo: json['seo'] != null ? SeoModel.fromJson(json['seo']) : null,
      images: json['images'] != null
          ? ImagesModel.fromJson(json['images'])
          : ImagesModel.empty,
      sources: SourceModel.fromJson(json['sources']),
      seasons: seasonJson?.map((key, value) =>
          MapEntry(int.parse(key), SeasonModel.fromJson(value))),
    );
  }

  @override
  List<Object?> get props => [
        id,
        parentId,
        typeId,
        type,
        statusId,
        productId,
        countryId,
        title,
        description,
        attributes,
        details,
        seo,
        images,
        sources,
        seasons
      ];
}
