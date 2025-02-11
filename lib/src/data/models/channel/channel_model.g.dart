// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChannelModelImpl _$$ChannelModelImplFromJson(Map<String, dynamic> json) =>
    _$ChannelModelImpl(
      id: (json['id'] as num).toInt(),
      statusId: (json['statusId'] as num?)?.toInt(),
      storageRecord: json['storageRecord'] == null
          ? null
          : StorageRecordModel.fromJson(
              json['storageRecord'] as Map<String, dynamic>),
      storage: json['storage'] == null
          ? null
          : StorageModel.fromJson(json['storage'] as Map<String, dynamic>),
      title: json['title'] as String,
      description: json['description'] as String,
      source: json['source'] as String,
      banner: json['banner'] as String,
    );

Map<String, dynamic> _$$ChannelModelImplToJson(_$ChannelModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusId': instance.statusId,
      'storageRecord': instance.storageRecord,
      'storage': instance.storage,
      'title': instance.title,
      'description': instance.description,
      'source': instance.source,
      'banner': instance.banner,
    };
