import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nrbtv/src/data/data.dart';

part 'media_model.freezed.dart';
part 'media_model.g.dart';

@Freezed(
    when: FreezedWhenOptions(when: true, maybeWhen: true, whenOrNull: true))
class MediaModel with _$MediaModel {
  const factory MediaModel.vod(VodModel vod) = _Vod;
  const factory MediaModel.episode(EpisodeModel episode) = _Episode;
  const factory MediaModel.channel(ChannelModel channel) = _Channel;

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);
}
