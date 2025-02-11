// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_tv_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VodTvDetailsState {
  bool get isSeasonBtnSelected => throw _privateConstructorUsedError;

  /// Create a copy of VodTvDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VodTvDetailsStateCopyWith<VodTvDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VodTvDetailsStateCopyWith<$Res> {
  factory $VodTvDetailsStateCopyWith(
          VodTvDetailsState value, $Res Function(VodTvDetailsState) then) =
      _$VodTvDetailsStateCopyWithImpl<$Res, VodTvDetailsState>;
  @useResult
  $Res call({bool isSeasonBtnSelected});
}

/// @nodoc
class _$VodTvDetailsStateCopyWithImpl<$Res, $Val extends VodTvDetailsState>
    implements $VodTvDetailsStateCopyWith<$Res> {
  _$VodTvDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VodTvDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSeasonBtnSelected = null,
  }) {
    return _then(_value.copyWith(
      isSeasonBtnSelected: null == isSeasonBtnSelected
          ? _value.isSeasonBtnSelected
          : isSeasonBtnSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VodTvDetailsStateImplCopyWith<$Res>
    implements $VodTvDetailsStateCopyWith<$Res> {
  factory _$$VodTvDetailsStateImplCopyWith(_$VodTvDetailsStateImpl value,
          $Res Function(_$VodTvDetailsStateImpl) then) =
      __$$VodTvDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSeasonBtnSelected});
}

/// @nodoc
class __$$VodTvDetailsStateImplCopyWithImpl<$Res>
    extends _$VodTvDetailsStateCopyWithImpl<$Res, _$VodTvDetailsStateImpl>
    implements _$$VodTvDetailsStateImplCopyWith<$Res> {
  __$$VodTvDetailsStateImplCopyWithImpl(_$VodTvDetailsStateImpl _value,
      $Res Function(_$VodTvDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VodTvDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSeasonBtnSelected = null,
  }) {
    return _then(_$VodTvDetailsStateImpl(
      isSeasonBtnSelected: null == isSeasonBtnSelected
          ? _value.isSeasonBtnSelected
          : isSeasonBtnSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$VodTvDetailsStateImpl extends _VodTvDetailsState {
  const _$VodTvDetailsStateImpl({this.isSeasonBtnSelected = false}) : super._();

  @override
  @JsonKey()
  final bool isSeasonBtnSelected;

  @override
  String toString() {
    return 'VodTvDetailsState(isSeasonBtnSelected: $isSeasonBtnSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VodTvDetailsStateImpl &&
            (identical(other.isSeasonBtnSelected, isSeasonBtnSelected) ||
                other.isSeasonBtnSelected == isSeasonBtnSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSeasonBtnSelected);

  /// Create a copy of VodTvDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VodTvDetailsStateImplCopyWith<_$VodTvDetailsStateImpl> get copyWith =>
      __$$VodTvDetailsStateImplCopyWithImpl<_$VodTvDetailsStateImpl>(
          this, _$identity);
}

abstract class _VodTvDetailsState extends VodTvDetailsState {
  const factory _VodTvDetailsState({final bool isSeasonBtnSelected}) =
      _$VodTvDetailsStateImpl;
  const _VodTvDetailsState._() : super._();

  @override
  bool get isSeasonBtnSelected;

  /// Create a copy of VodTvDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VodTvDetailsStateImplCopyWith<_$VodTvDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
