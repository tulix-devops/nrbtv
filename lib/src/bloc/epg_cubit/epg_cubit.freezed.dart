// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epg_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EpgState {
  Status get status => throw _privateConstructorUsedError;
  TvScheduleModel? get selectedDvr => throw _privateConstructorUsedError;
  Map<String, List<TvScheduleModel>>? get epgContent =>
      throw _privateConstructorUsedError;
  LiveModel? get live => throw _privateConstructorUsedError;

  /// Create a copy of EpgState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EpgStateCopyWith<EpgState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpgStateCopyWith<$Res> {
  factory $EpgStateCopyWith(EpgState value, $Res Function(EpgState) then) =
      _$EpgStateCopyWithImpl<$Res, EpgState>;
  @useResult
  $Res call(
      {Status status,
      TvScheduleModel? selectedDvr,
      Map<String, List<TvScheduleModel>>? epgContent,
      LiveModel? live});
}

/// @nodoc
class _$EpgStateCopyWithImpl<$Res, $Val extends EpgState>
    implements $EpgStateCopyWith<$Res> {
  _$EpgStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EpgState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selectedDvr = freezed,
    Object? epgContent = freezed,
    Object? live = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      selectedDvr: freezed == selectedDvr
          ? _value.selectedDvr
          : selectedDvr // ignore: cast_nullable_to_non_nullable
              as TvScheduleModel?,
      epgContent: freezed == epgContent
          ? _value.epgContent
          : epgContent // ignore: cast_nullable_to_non_nullable
              as Map<String, List<TvScheduleModel>>?,
      live: freezed == live
          ? _value.live
          : live // ignore: cast_nullable_to_non_nullable
              as LiveModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpgStateImplCopyWith<$Res>
    implements $EpgStateCopyWith<$Res> {
  factory _$$EpgStateImplCopyWith(
          _$EpgStateImpl value, $Res Function(_$EpgStateImpl) then) =
      __$$EpgStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      TvScheduleModel? selectedDvr,
      Map<String, List<TvScheduleModel>>? epgContent,
      LiveModel? live});
}

/// @nodoc
class __$$EpgStateImplCopyWithImpl<$Res>
    extends _$EpgStateCopyWithImpl<$Res, _$EpgStateImpl>
    implements _$$EpgStateImplCopyWith<$Res> {
  __$$EpgStateImplCopyWithImpl(
      _$EpgStateImpl _value, $Res Function(_$EpgStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EpgState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selectedDvr = freezed,
    Object? epgContent = freezed,
    Object? live = freezed,
  }) {
    return _then(_$EpgStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      selectedDvr: freezed == selectedDvr
          ? _value.selectedDvr
          : selectedDvr // ignore: cast_nullable_to_non_nullable
              as TvScheduleModel?,
      epgContent: freezed == epgContent
          ? _value._epgContent
          : epgContent // ignore: cast_nullable_to_non_nullable
              as Map<String, List<TvScheduleModel>>?,
      live: freezed == live
          ? _value.live
          : live // ignore: cast_nullable_to_non_nullable
              as LiveModel?,
    ));
  }
}

/// @nodoc

class _$EpgStateImpl extends _EpgState {
  const _$EpgStateImpl(
      {this.status = Status.initial,
      this.selectedDvr = null,
      final Map<String, List<TvScheduleModel>>? epgContent = null,
      this.live = null})
      : _epgContent = epgContent,
        super._();

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final TvScheduleModel? selectedDvr;
  final Map<String, List<TvScheduleModel>>? _epgContent;
  @override
  @JsonKey()
  Map<String, List<TvScheduleModel>>? get epgContent {
    final value = _epgContent;
    if (value == null) return null;
    if (_epgContent is EqualUnmodifiableMapView) return _epgContent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final LiveModel? live;

  @override
  String toString() {
    return 'EpgState(status: $status, selectedDvr: $selectedDvr, epgContent: $epgContent, live: $live)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpgStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.selectedDvr, selectedDvr) ||
                other.selectedDvr == selectedDvr) &&
            const DeepCollectionEquality()
                .equals(other._epgContent, _epgContent) &&
            (identical(other.live, live) || other.live == live));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, selectedDvr,
      const DeepCollectionEquality().hash(_epgContent), live);

  /// Create a copy of EpgState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EpgStateImplCopyWith<_$EpgStateImpl> get copyWith =>
      __$$EpgStateImplCopyWithImpl<_$EpgStateImpl>(this, _$identity);
}

abstract class _EpgState extends EpgState {
  const factory _EpgState(
      {final Status status,
      final TvScheduleModel? selectedDvr,
      final Map<String, List<TvScheduleModel>>? epgContent,
      final LiveModel? live}) = _$EpgStateImpl;
  const _EpgState._() : super._();

  @override
  Status get status;
  @override
  TvScheduleModel? get selectedDvr;
  @override
  Map<String, List<TvScheduleModel>>? get epgContent;
  @override
  LiveModel? get live;

  /// Create a copy of EpgState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EpgStateImplCopyWith<_$EpgStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
