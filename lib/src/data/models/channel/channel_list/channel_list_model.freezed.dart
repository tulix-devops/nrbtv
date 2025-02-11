// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChannelListModel _$ChannelListModelFromJson(Map<String, dynamic> json) {
  return _ChannelListModel.fromJson(json);
}

/// @nodoc
mixin _$ChannelListModel {
  @JsonKey(name: 'data')
  List<ChannelModel> get channels => throw _privateConstructorUsedError;

  /// Serializes this ChannelListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChannelListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChannelListModelCopyWith<ChannelListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelListModelCopyWith<$Res> {
  factory $ChannelListModelCopyWith(
          ChannelListModel value, $Res Function(ChannelListModel) then) =
      _$ChannelListModelCopyWithImpl<$Res, ChannelListModel>;
  @useResult
  $Res call({@JsonKey(name: 'data') List<ChannelModel> channels});
}

/// @nodoc
class _$ChannelListModelCopyWithImpl<$Res, $Val extends ChannelListModel>
    implements $ChannelListModelCopyWith<$Res> {
  _$ChannelListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChannelListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channels = null,
  }) {
    return _then(_value.copyWith(
      channels: null == channels
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<ChannelModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChannelListModelImplCopyWith<$Res>
    implements $ChannelListModelCopyWith<$Res> {
  factory _$$ChannelListModelImplCopyWith(_$ChannelListModelImpl value,
          $Res Function(_$ChannelListModelImpl) then) =
      __$$ChannelListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'data') List<ChannelModel> channels});
}

/// @nodoc
class __$$ChannelListModelImplCopyWithImpl<$Res>
    extends _$ChannelListModelCopyWithImpl<$Res, _$ChannelListModelImpl>
    implements _$$ChannelListModelImplCopyWith<$Res> {
  __$$ChannelListModelImplCopyWithImpl(_$ChannelListModelImpl _value,
      $Res Function(_$ChannelListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChannelListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channels = null,
  }) {
    return _then(_$ChannelListModelImpl(
      channels: null == channels
          ? _value._channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<ChannelModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelListModelImpl implements _ChannelListModel {
  const _$ChannelListModelImpl(
      {@JsonKey(name: 'data') required final List<ChannelModel> channels})
      : _channels = channels;

  factory _$ChannelListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelListModelImplFromJson(json);

  final List<ChannelModel> _channels;
  @override
  @JsonKey(name: 'data')
  List<ChannelModel> get channels {
    if (_channels is EqualUnmodifiableListView) return _channels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_channels);
  }

  @override
  String toString() {
    return 'ChannelListModel(channels: $channels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelListModelImpl &&
            const DeepCollectionEquality().equals(other._channels, _channels));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_channels));

  /// Create a copy of ChannelListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelListModelImplCopyWith<_$ChannelListModelImpl> get copyWith =>
      __$$ChannelListModelImplCopyWithImpl<_$ChannelListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelListModelImplToJson(
      this,
    );
  }
}

abstract class _ChannelListModel implements ChannelListModel {
  const factory _ChannelListModel(
          {@JsonKey(name: 'data') required final List<ChannelModel> channels}) =
      _$ChannelListModelImpl;

  factory _ChannelListModel.fromJson(Map<String, dynamic> json) =
      _$ChannelListModelImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  List<ChannelModel> get channels;

  /// Create a copy of ChannelListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChannelListModelImplCopyWith<_$ChannelListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
