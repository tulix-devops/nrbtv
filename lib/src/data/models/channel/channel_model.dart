import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:nrbtv/src/data/data.dart';

part 'channel_model.freezed.dart';
part 'channel_model.g.dart';

@freezed
class ChannelModel with _$ChannelModel {
  const factory ChannelModel({
    required int id,
    required int? statusId,
    required StorageRecordModel? storageRecord,
    required StorageModel? storage,
    required String title,
    required String description,
    required String source,
    required String banner,
  }) = _ChannelModel;

  factory ChannelModel.fromJson(Map<String, dynamic> json) =>
      _$ChannelModelFromJson(json);

  static const empty = ChannelModel(
    id: 0,
    statusId: 0,
    storageRecord: StorageRecordModel.empty,
    storage: StorageModel.empty,
    title: '',
    description: '',
    source: '',
    banner: '',
  );
}
