import 'package:equatable/equatable.dart';
import 'package:nrbtv/src/data/models/content/pagination_model.dart';
import 'package:nrbtv/src/data/models/content/tv_schedule_model.dart';

class ScheduleModel extends Equatable {
  final Map<String, List<TvScheduleModel>> data;
  final PaginationModel pagination;

  const ScheduleModel({required this.data, required this.pagination});

  @override
  List<Object?> get props => [data, pagination];

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    final data = (json['data'] as Map<String, dynamic>).map(
      (key, value) => MapEntry(
        key,
        (value as List<dynamic>)
            .map((e) => TvScheduleModel.fromJson(e))
            .toList(),
      ),
    );

    return ScheduleModel(
      data: data,
      pagination: PaginationModel.fromJson(json['pagination']),
    );
  }
}
