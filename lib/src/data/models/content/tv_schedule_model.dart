import 'package:equatable/equatable.dart';

class TvScheduleModel extends Equatable {
  final int id;
  final String start;
  final String end;
  final String name;
  final String link;
  final String thumbnail;
  final bool isFuture;

  const TvScheduleModel({
    required this.id,
    required this.start,
    required this.end,
    required this.name,
    required this.link,
    required this.thumbnail,
    required this.isFuture,
  });

  factory TvScheduleModel.fromJson(Map<String, dynamic> json) {
    return TvScheduleModel(
      id: json['id'] ?? 0,
      start: json['start'] as String? ?? '',
      end: json['end'] as String? ?? '',
      name: json['name'] as String? ?? '',
      link: json['link'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
      isFuture: json['isFuture'] as bool? ?? true,
    );
  }

  @override
  List<Object?> get props => [id, start, end, name, link, thumbnail];
}
