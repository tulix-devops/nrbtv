import 'package:equatable/equatable.dart';

class SeoModel extends Equatable {
  const SeoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.keywords,
  });
  final int id;
  final String? title;
  final String? description;
  final String? keywords;

  factory SeoModel.fromJson(Map<String, dynamic> json) => SeoModel(
        id: json['id'] as int,
        title: (json['title'] as String?),
        description: json['description'] as String?,
        keywords: json['keywords'] as String?,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'keywords': keywords,
    };
  }

  @override
  List<Object?> get props => [id, title, description, keywords];

  static const empty = SeoModel(
    id: 0,
    title: null,
    description: null,
    keywords: null,
  );
}
