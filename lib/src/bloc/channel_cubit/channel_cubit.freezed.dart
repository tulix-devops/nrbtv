// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChannelState {
  Status get status => throw _privateConstructorUsedError;
  List<ChannelModel> get channels => throw _privateConstructorUsedError;
  ChannelModel? get selectedChannel => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChannelStateCopyWith<ChannelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelStateCopyWith<$Res> {
  factory $ChannelStateCopyWith(
          ChannelState value, $Res Function(ChannelState) then) =
      _$ChannelStateCopyWithImpl<$Res, ChannelState>;
  @useResult
  $Res call(
      {Status status,
      List<ChannelModel> channels,
      ChannelModel? selectedChannel,
      String? error});

  $ChannelModelCopyWith<$Res>? get selectedChannel;
}

/// @nodoc
class _$ChannelStateCopyWithImpl<$Res, $Val extends ChannelState>
    implements $ChannelStateCopyWith<$Res> {
  _$ChannelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? channels = null,
    Object? selectedChannel = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      channels: null == channels
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<ChannelModel>,
      selectedChannel: freezed == selectedChannel
          ? _value.selectedChannel
          : selectedChannel // ignore: cast_nullable_to_non_nullable
              as ChannelModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelModelCopyWith<$Res>? get selectedChannel {
    if (_value.selectedChannel == null) {
      return null;
    }

    return $ChannelModelCopyWith<$Res>(_value.selectedChannel!, (value) {
      return _then(_value.copyWith(selectedChannel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChannelStateImplCopyWith<$Res>
    implements $ChannelStateCopyWith<$Res> {
  factory _$$ChannelStateImplCopyWith(
          _$ChannelStateImpl value, $Res Function(_$ChannelStateImpl) then) =
      __$$ChannelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      List<ChannelModel> channels,
      ChannelModel? selectedChannel,
      String? error});

  @override
  $ChannelModelCopyWith<$Res>? get selectedChannel;
}

/// @nodoc
class __$$ChannelStateImplCopyWithImpl<$Res>
    extends _$ChannelStateCopyWithImpl<$Res, _$ChannelStateImpl>
    implements _$$ChannelStateImplCopyWith<$Res> {
  __$$ChannelStateImplCopyWithImpl(
      _$ChannelStateImpl _value, $Res Function(_$ChannelStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? channels = null,
    Object? selectedChannel = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ChannelStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      channels: null == channels
          ? _value._channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<ChannelModel>,
      selectedChannel: freezed == selectedChannel
          ? _value.selectedChannel
          : selectedChannel // ignore: cast_nullable_to_non_nullable
              as ChannelModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChannelStateImpl extends _ChannelState {
  const _$ChannelStateImpl(
      {this.status = Status.initial,
      final List<ChannelModel> channels = const [],
      this.selectedChannel = null,
      this.error})
      : _channels = channels,
        super._();

  @override
  @JsonKey()
  final Status status;
  final List<ChannelModel> _channels;
  @override
  @JsonKey()
  List<ChannelModel> get channels {
    if (_channels is EqualUnmodifiableListView) return _channels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_channels);
  }

  @override
  @JsonKey()
  final ChannelModel? selectedChannel;
  @override
  final String? error;

  @override
  String toString() {
    return 'ChannelState(status: $status, channels: $channels, selectedChannel: $selectedChannel, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._channels, _channels) &&
            (identical(other.selectedChannel, selectedChannel) ||
                other.selectedChannel == selectedChannel) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_channels), selectedChannel, error);

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelStateImplCopyWith<_$ChannelStateImpl> get copyWith =>
      __$$ChannelStateImplCopyWithImpl<_$ChannelStateImpl>(this, _$identity);
}

abstract class _ChannelState extends ChannelState {
  const factory _ChannelState(
      {final Status status,
      final List<ChannelModel> channels,
      final ChannelModel? selectedChannel,
      final String? error}) = _$ChannelStateImpl;
  const _ChannelState._() : super._();

  @override
  Status get status;
  @override
  List<ChannelModel> get channels;
  @override
  ChannelModel? get selectedChannel;
  @override
  String? get error;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChannelStateImplCopyWith<_$ChannelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
