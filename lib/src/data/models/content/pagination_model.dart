import 'package:equatable/equatable.dart';

class PaginationModel extends Equatable {
  final int currentWeek;
  final int prevWeek;
  final int nextWeek;

  const PaginationModel({
    required this.currentWeek,
    required this.prevWeek,
    required this.nextWeek,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      currentWeek: json['currentWeek'] ?? 0,
      prevWeek: json["prevWeek"] ?? 0,
      nextWeek: json["nextWeek"] ?? 0,
    );
  }

  @override
  List<Object?> get props => [currentWeek, prevWeek, nextWeek];
}
