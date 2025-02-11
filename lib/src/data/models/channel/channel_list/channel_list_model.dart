// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nrbtv/src/data/data.dart';

part 'channel_list_model.freezed.dart';
part 'channel_list_model.g.dart';

@freezed
class ChannelListModel with _$ChannelListModel {
  const factory ChannelListModel({
    @JsonKey(name: 'data') required List<ChannelModel> channels,
  }) = _ChannelListModel;

  factory ChannelListModel.fromJson(Map<String, dynamic> json) =>
      _$ChannelListModelFromJson(json);

  static const empty = ChannelListModel(channels: []);
}
