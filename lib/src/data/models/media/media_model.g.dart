// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VodImpl _$$VodImplFromJson(Map<String, dynamic> json) => _$VodImpl(
      VodModel.fromJson(json['vod'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$VodImplToJson(_$VodImpl instance) => <String, dynamic>{
      'vod': instance.vod,
      'runtimeType': instance.$type,
    };

_$EpisodeImpl _$$EpisodeImplFromJson(Map<String, dynamic> json) =>
    _$EpisodeImpl(
      EpisodeModel.fromJson(json['episode'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EpisodeImplToJson(_$EpisodeImpl instance) =>
    <String, dynamic>{
      'episode': instance.episode,
      'runtimeType': instance.$type,
    };

_$ChannelImpl _$$ChannelImplFromJson(Map<String, dynamic> json) =>
    _$ChannelImpl(
      ChannelModel.fromJson(json['channel'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChannelImplToJson(_$ChannelImpl instance) =>
    <String, dynamic>{
      'channel': instance.channel,
      'runtimeType': instance.$type,
    };
