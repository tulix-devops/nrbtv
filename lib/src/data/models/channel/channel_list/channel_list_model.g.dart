// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChannelListModelImpl _$$ChannelListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChannelListModelImpl(
      channels: (json['data'] as List<dynamic>)
          .map((e) => ChannelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChannelListModelImplToJson(
        _$ChannelListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.channels,
    };
