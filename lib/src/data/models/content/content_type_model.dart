import 'package:equatable/equatable.dart';

class ContentTypeModel extends Equatable {
  const ContentTypeModel({required this.id, required this.title});
  final int id;
  final String title;

  factory ContentTypeModel.fromJson(Map<String, dynamic> json) {
    return ContentTypeModel(
        id: json['id'] as int, title: json['name'] as String);
  }

  @override
  List<Object?> get props => [id, title];
}
