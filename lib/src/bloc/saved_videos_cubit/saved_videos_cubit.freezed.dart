// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_videos_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SavedVideosState {
  Status get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<VodModel> get videos => throw _privateConstructorUsedError;

  /// Create a copy of SavedVideosState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedVideosStateCopyWith<SavedVideosState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedVideosStateCopyWith<$Res> {
  factory $SavedVideosStateCopyWith(
          SavedVideosState value, $Res Function(SavedVideosState) then) =
      _$SavedVideosStateCopyWithImpl<$Res, SavedVideosState>;
  @useResult
  $Res call({Status status, String? error, List<VodModel> videos});
}

/// @nodoc
class _$SavedVideosStateCopyWithImpl<$Res, $Val extends SavedVideosState>
    implements $SavedVideosStateCopyWith<$Res> {
  _$SavedVideosStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedVideosState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? videos = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      videos: null == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<VodModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavedVideosStateImplCopyWith<$Res>
    implements $SavedVideosStateCopyWith<$Res> {
  factory _$$SavedVideosStateImplCopyWith(_$SavedVideosStateImpl value,
          $Res Function(_$SavedVideosStateImpl) then) =
      __$$SavedVideosStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, String? error, List<VodModel> videos});
}

/// @nodoc
class __$$SavedVideosStateImplCopyWithImpl<$Res>
    extends _$SavedVideosStateCopyWithImpl<$Res, _$SavedVideosStateImpl>
    implements _$$SavedVideosStateImplCopyWith<$Res> {
  __$$SavedVideosStateImplCopyWithImpl(_$SavedVideosStateImpl _value,
      $Res Function(_$SavedVideosStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavedVideosState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? videos = null,
  }) {
    return _then(_$SavedVideosStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      videos: null == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<VodModel>,
    ));
  }
}

/// @nodoc

class _$SavedVideosStateImpl implements _SavedVideosState {
  const _$SavedVideosStateImpl(
      {this.status = Status.initial,
      this.error,
      final List<VodModel> videos = const []})
      : _videos = videos;

  @override
  @JsonKey()
  final Status status;
  @override
  final String? error;
  final List<VodModel> _videos;
  @override
  @JsonKey()
  List<VodModel> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  @override
  String toString() {
    return 'SavedVideosState(status: $status, error: $error, videos: $videos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedVideosStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._videos, _videos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, error, const DeepCollectionEquality().hash(_videos));

  /// Create a copy of SavedVideosState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedVideosStateImplCopyWith<_$SavedVideosStateImpl> get copyWith =>
      __$$SavedVideosStateImplCopyWithImpl<_$SavedVideosStateImpl>(
          this, _$identity);
}

abstract class _SavedVideosState implements SavedVideosState {
  const factory _SavedVideosState(
      {final Status status,
      final String? error,
      final List<VodModel> videos}) = _$SavedVideosStateImpl;

  @override
  Status get status;
  @override
  String? get error;
  @override
  List<VodModel> get videos;

  /// Create a copy of SavedVideosState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedVideosStateImplCopyWith<_$SavedVideosStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
