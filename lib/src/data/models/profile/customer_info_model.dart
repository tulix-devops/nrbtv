import 'package:equatable/equatable.dart';

class CustomerInfoModel extends Equatable {
  const CustomerInfoModel({
    required this.id,
    required this.statusId,
    required this.name,
    required this.lastname,
    required this.email,
  });

  final int id;
  final int statusId;
  final String name;
  final String lastname;
  final String email;

  factory CustomerInfoModel.fromJson(Map<String, dynamic> json) {
    return CustomerInfoModel(
      id: json['id'] as int? ?? 0,
      statusId: json['statusId'] as int? ?? 0,
      name: json['name'] as String? ?? 'None',
      lastname: json['lastname'] as String? ?? 'None',
      email: json['email'] as String? ?? 'None',
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, statusId, name, lastname, email];
}
