import 'package:equatable/equatable.dart';
import 'package:nrbtv/src/data/models/content/content.dart';

class SeasonModel extends Equatable {
  final Map<int, ContentModel> episodes;

  const SeasonModel({required this.episodes});

  factory SeasonModel.fromJson(Map<String, dynamic> json) {
    return SeasonModel(
      episodes:
          json.map((k, v) => MapEntry(int.parse(k), ContentModel.fromJson(v))),
    );
  }

  Map<String, dynamic> toJson() {
    return episodes.map((k, v) => MapEntry(k.toString(), v.toJson()));
  }

  @override
  List<Object?> get props => [episodes];
}
