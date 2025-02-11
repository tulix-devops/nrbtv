// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'related_vod_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RelatedVodState {
  Status get status => throw _privateConstructorUsedError;
  List<VodModel> get relatedVodList => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of RelatedVodState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelatedVodStateCopyWith<RelatedVodState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelatedVodStateCopyWith<$Res> {
  factory $RelatedVodStateCopyWith(
          RelatedVodState value, $Res Function(RelatedVodState) then) =
      _$RelatedVodStateCopyWithImpl<$Res, RelatedVodState>;
  @useResult
  $Res call({Status status, List<VodModel> relatedVodList, String? error});
}

/// @nodoc
class _$RelatedVodStateCopyWithImpl<$Res, $Val extends RelatedVodState>
    implements $RelatedVodStateCopyWith<$Res> {
  _$RelatedVodStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelatedVodState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? relatedVodList = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      relatedVodList: null == relatedVodList
          ? _value.relatedVodList
          : relatedVodList // ignore: cast_nullable_to_non_nullable
              as List<VodModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RelatedVodStateImplCopyWith<$Res>
    implements $RelatedVodStateCopyWith<$Res> {
  factory _$$RelatedVodStateImplCopyWith(_$RelatedVodStateImpl value,
          $Res Function(_$RelatedVodStateImpl) then) =
      __$$RelatedVodStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, List<VodModel> relatedVodList, String? error});
}

/// @nodoc
class __$$RelatedVodStateImplCopyWithImpl<$Res>
    extends _$RelatedVodStateCopyWithImpl<$Res, _$RelatedVodStateImpl>
    implements _$$RelatedVodStateImplCopyWith<$Res> {
  __$$RelatedVodStateImplCopyWithImpl(
      _$RelatedVodStateImpl _value, $Res Function(_$RelatedVodStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RelatedVodState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? relatedVodList = null,
    Object? error = freezed,
  }) {
    return _then(_$RelatedVodStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      relatedVodList: null == relatedVodList
          ? _value._relatedVodList
          : relatedVodList // ignore: cast_nullable_to_non_nullable
              as List<VodModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RelatedVodStateImpl implements _RelatedVodState {
  const _$RelatedVodStateImpl(
      {this.status = Status.initial,
      final List<VodModel> relatedVodList = const [],
      this.error})
      : _relatedVodList = relatedVodList;

  @override
  @JsonKey()
  final Status status;
  final List<VodModel> _relatedVodList;
  @override
  @JsonKey()
  List<VodModel> get relatedVodList {
    if (_relatedVodList is EqualUnmodifiableListView) return _relatedVodList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedVodList);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'RelatedVodState(status: $status, relatedVodList: $relatedVodList, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelatedVodStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._relatedVodList, _relatedVodList) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_relatedVodList), error);

  /// Create a copy of RelatedVodState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelatedVodStateImplCopyWith<_$RelatedVodStateImpl> get copyWith =>
      __$$RelatedVodStateImplCopyWithImpl<_$RelatedVodStateImpl>(
          this, _$identity);
}

abstract class _RelatedVodState implements RelatedVodState {
  const factory _RelatedVodState(
      {final Status status,
      final List<VodModel> relatedVodList,
      final String? error}) = _$RelatedVodStateImpl;

  @override
  Status get status;
  @override
  List<VodModel> get relatedVodList;
  @override
  String? get error;

  /// Create a copy of RelatedVodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelatedVodStateImplCopyWith<_$RelatedVodStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
