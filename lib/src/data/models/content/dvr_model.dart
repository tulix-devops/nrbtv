import 'package:equatable/equatable.dart';

class Dvr extends Equatable {
  final String from;
  final String to;
  final String link;
  final String thumbnail;
  const Dvr({
    required this.from,
    required this.to,
    required this.thumbnail,
    required this.link,
  });

  factory Dvr.fromJson(Map<String, dynamic> json) {
    return Dvr(
      from: json['from'],
      to: json['to'],
      thumbnail: json['thumbnail'],
      link: json['link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
      'thumbnail': thumbnail,
      'link': link,
    };
  }

  @override
  List<Object?> get props => [from, to, link, thumbnail];
}
