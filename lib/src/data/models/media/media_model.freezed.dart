// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MediaModel _$MediaModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'vod':
      return _Vod.fromJson(json);
    case 'episode':
      return _Episode.fromJson(json);
    case 'channel':
      return _Channel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'MediaModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$MediaModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VodModel vod) vod,
    required TResult Function(EpisodeModel episode) episode,
    required TResult Function(ChannelModel channel) channel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VodModel vod)? vod,
    TResult? Function(EpisodeModel episode)? episode,
    TResult? Function(ChannelModel channel)? channel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VodModel vod)? vod,
    TResult Function(EpisodeModel episode)? episode,
    TResult Function(ChannelModel channel)? channel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Vod value) vod,
    required TResult Function(_Episode value) episode,
    required TResult Function(_Channel value) channel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Vod value)? vod,
    TResult? Function(_Episode value)? episode,
    TResult? Function(_Channel value)? channel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Vod value)? vod,
    TResult Function(_Episode value)? episode,
    TResult Function(_Channel value)? channel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this MediaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaModelCopyWith<$Res> {
  factory $MediaModelCopyWith(
          MediaModel value, $Res Function(MediaModel) then) =
      _$MediaModelCopyWithImpl<$Res, MediaModel>;
}

/// @nodoc
class _$MediaModelCopyWithImpl<$Res, $Val extends MediaModel>
    implements $MediaModelCopyWith<$Res> {
  _$MediaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$VodImplCopyWith<$Res> {
  factory _$$VodImplCopyWith(_$VodImpl value, $Res Function(_$VodImpl) then) =
      __$$VodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VodModel vod});

  $VodModelCopyWith<$Res> get vod;
}

/// @nodoc
class __$$VodImplCopyWithImpl<$Res>
    extends _$MediaModelCopyWithImpl<$Res, _$VodImpl>
    implements _$$VodImplCopyWith<$Res> {
  __$$VodImplCopyWithImpl(_$VodImpl _value, $Res Function(_$VodImpl) _then)
      : super(_value, _then);

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vod = null,
  }) {
    return _then(_$VodImpl(
      null == vod
          ? _value.vod
          : vod // ignore: cast_nullable_to_non_nullable
              as VodModel,
    ));
  }

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodModelCopyWith<$Res> get vod {
    return $VodModelCopyWith<$Res>(_value.vod, (value) {
      return _then(_value.copyWith(vod: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$VodImpl implements _Vod {
  const _$VodImpl(this.vod, {final String? $type}) : $type = $type ?? 'vod';

  factory _$VodImpl.fromJson(Map<String, dynamic> json) =>
      _$$VodImplFromJson(json);

  @override
  final VodModel vod;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MediaModel.vod(vod: $vod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VodImpl &&
            (identical(other.vod, vod) || other.vod == vod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, vod);

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VodImplCopyWith<_$VodImpl> get copyWith =>
      __$$VodImplCopyWithImpl<_$VodImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VodModel vod) vod,
    required TResult Function(EpisodeModel episode) episode,
    required TResult Function(ChannelModel channel) channel,
  }) {
    return vod(this.vod);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VodModel vod)? vod,
    TResult? Function(EpisodeModel episode)? episode,
    TResult? Function(ChannelModel channel)? channel,
  }) {
    return vod?.call(this.vod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VodModel vod)? vod,
    TResult Function(EpisodeModel episode)? episode,
    TResult Function(ChannelModel channel)? channel,
    required TResult orElse(),
  }) {
    if (vod != null) {
      return vod(this.vod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Vod value) vod,
    required TResult Function(_Episode value) episode,
    required TResult Function(_Channel value) channel,
  }) {
    return vod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Vod value)? vod,
    TResult? Function(_Episode value)? episode,
    TResult? Function(_Channel value)? channel,
  }) {
    return vod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Vod value)? vod,
    TResult Function(_Episode value)? episode,
    TResult Function(_Channel value)? channel,
    required TResult orElse(),
  }) {
    if (vod != null) {
      return vod(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VodImplToJson(
      this,
    );
  }
}

abstract class _Vod implements MediaModel {
  const factory _Vod(final VodModel vod) = _$VodImpl;

  factory _Vod.fromJson(Map<String, dynamic> json) = _$VodImpl.fromJson;

  VodModel get vod;

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VodImplCopyWith<_$VodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EpisodeImplCopyWith<$Res> {
  factory _$$EpisodeImplCopyWith(
          _$EpisodeImpl value, $Res Function(_$EpisodeImpl) then) =
      __$$EpisodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EpisodeModel episode});

  $EpisodeModelCopyWith<$Res> get episode;
}

/// @nodoc
class __$$EpisodeImplCopyWithImpl<$Res>
    extends _$MediaModelCopyWithImpl<$Res, _$EpisodeImpl>
    implements _$$EpisodeImplCopyWith<$Res> {
  __$$EpisodeImplCopyWithImpl(
      _$EpisodeImpl _value, $Res Function(_$EpisodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? episode = null,
  }) {
    return _then(_$EpisodeImpl(
      null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as EpisodeModel,
    ));
  }

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EpisodeModelCopyWith<$Res> get episode {
    return $EpisodeModelCopyWith<$Res>(_value.episode, (value) {
      return _then(_value.copyWith(episode: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$EpisodeImpl implements _Episode {
  const _$EpisodeImpl(this.episode, {final String? $type})
      : $type = $type ?? 'episode';

  factory _$EpisodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeImplFromJson(json);

  @override
  final EpisodeModel episode;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MediaModel.episode(episode: $episode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeImpl &&
            (identical(other.episode, episode) || other.episode == episode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, episode);

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
      __$$EpisodeImplCopyWithImpl<_$EpisodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VodModel vod) vod,
    required TResult Function(EpisodeModel episode) episode,
    required TResult Function(ChannelModel channel) channel,
  }) {
    return episode(this.episode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VodModel vod)? vod,
    TResult? Function(EpisodeModel episode)? episode,
    TResult? Function(ChannelModel channel)? channel,
  }) {
    return episode?.call(this.episode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VodModel vod)? vod,
    TResult Function(EpisodeModel episode)? episode,
    TResult Function(ChannelModel channel)? channel,
    required TResult orElse(),
  }) {
    if (episode != null) {
      return episode(this.episode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Vod value) vod,
    required TResult Function(_Episode value) episode,
    required TResult Function(_Channel value) channel,
  }) {
    return episode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Vod value)? vod,
    TResult? Function(_Episode value)? episode,
    TResult? Function(_Channel value)? channel,
  }) {
    return episode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Vod value)? vod,
    TResult Function(_Episode value)? episode,
    TResult Function(_Channel value)? channel,
    required TResult orElse(),
  }) {
    if (episode != null) {
      return episode(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeImplToJson(
      this,
    );
  }
}

abstract class _Episode implements MediaModel {
  const factory _Episode(final EpisodeModel episode) = _$EpisodeImpl;

  factory _Episode.fromJson(Map<String, dynamic> json) = _$EpisodeImpl.fromJson;

  EpisodeModel get episode;

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChannelImplCopyWith<$Res> {
  factory _$$ChannelImplCopyWith(
          _$ChannelImpl value, $Res Function(_$ChannelImpl) then) =
      __$$ChannelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChannelModel channel});

  $ChannelModelCopyWith<$Res> get channel;
}

/// @nodoc
class __$$ChannelImplCopyWithImpl<$Res>
    extends _$MediaModelCopyWithImpl<$Res, _$ChannelImpl>
    implements _$$ChannelImplCopyWith<$Res> {
  __$$ChannelImplCopyWithImpl(
      _$ChannelImpl _value, $Res Function(_$ChannelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
  }) {
    return _then(_$ChannelImpl(
      null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as ChannelModel,
    ));
  }

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelModelCopyWith<$Res> get channel {
    return $ChannelModelCopyWith<$Res>(_value.channel, (value) {
      return _then(_value.copyWith(channel: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelImpl implements _Channel {
  const _$ChannelImpl(this.channel, {final String? $type})
      : $type = $type ?? 'channel';

  factory _$ChannelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelImplFromJson(json);

  @override
  final ChannelModel channel;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MediaModel.channel(channel: $channel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelImpl &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, channel);

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelImplCopyWith<_$ChannelImpl> get copyWith =>
      __$$ChannelImplCopyWithImpl<_$ChannelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VodModel vod) vod,
    required TResult Function(EpisodeModel episode) episode,
    required TResult Function(ChannelModel channel) channel,
  }) {
    return channel(this.channel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VodModel vod)? vod,
    TResult? Function(EpisodeModel episode)? episode,
    TResult? Function(ChannelModel channel)? channel,
  }) {
    return channel?.call(this.channel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VodModel vod)? vod,
    TResult Function(EpisodeModel episode)? episode,
    TResult Function(ChannelModel channel)? channel,
    required TResult orElse(),
  }) {
    if (channel != null) {
      return channel(this.channel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Vod value) vod,
    required TResult Function(_Episode value) episode,
    required TResult Function(_Channel value) channel,
  }) {
    return channel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Vod value)? vod,
    TResult? Function(_Episode value)? episode,
    TResult? Function(_Channel value)? channel,
  }) {
    return channel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Vod value)? vod,
    TResult Function(_Episode value)? episode,
    TResult Function(_Channel value)? channel,
    required TResult orElse(),
  }) {
    if (channel != null) {
      return channel(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelImplToJson(
      this,
    );
  }
}

abstract class _Channel implements MediaModel {
  const factory _Channel(final ChannelModel channel) = _$ChannelImpl;

  factory _Channel.fromJson(Map<String, dynamic> json) = _$ChannelImpl.fromJson;

  ChannelModel get channel;

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChannelImplCopyWith<_$ChannelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
