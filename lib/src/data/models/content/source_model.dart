import 'package:equatable/equatable.dart';
import 'package:nrbtv/src/data/models/content/dvr_model.dart';

class SourceModel extends Equatable {
  const SourceModel({
    required this.dvr,
    required this.id,
    required this.primary,
    required this.secondary,
    required this.trailer,
    required this.hls,
    required this.dash,
    required this.file,
  });
  final int id;
  final String? primary;
  final String? secondary;
  final String? trailer;
  final String? hls;
  final String? dash;
  final String? file;
  final Map<String, List<Dvr>>? dvr;

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json['id'] as int,
        primary: json['primary'] as String?,
        secondary: json['secondary'] as String?,
        trailer: json['trailer'] as String?,
        hls: json['hls'] as String?,
        dash: json['dash'] as String?,
        file: json['file'] as String?,
        dvr: json['dvr'] != null
            ? (json['dvr'] as Map<String, dynamic>).map((key, value) {
                return MapEntry(
                  key,
                  (value as List<dynamic>)
                      .map((item) => Dvr.fromJson(item))
                      .toList(),
                );
              })
            : null,
      );

  Map<String, dynamic> toJson() {
    final data = {
      'id': id,
      'primary': primary,
      'secondary': secondary,
      'trailer': trailer,
      'hls': hls,
      'dash': dash,
      'file': file,
    };
    if (dvr != null) {
      data['dvr'] = dvr!.map((key, value) => MapEntry(
            key,
            value.map((dvr) => dvr.toJson()).toList(),
          ));
    }
    return data;
  }

  String? getPreferredVideoSource() {
    final sources = [primary, secondary, file, hls, dash];
    for (final source in sources) {
      if (isValidUrl(source)) {
        return source;
      }
    }
    return null;
  }

  bool isValidUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    return url.startsWith('http');
  }

  @override
  List<Object?> get props => [id, primary, secondary, trailer, hls, dash, file];

  static const empty = SourceModel(
    id: 0,
    primary: null,
    secondary: null,
    trailer: null,
    hls: null,
    dash: null,
    file: null,
    dvr: null,
  );
}
