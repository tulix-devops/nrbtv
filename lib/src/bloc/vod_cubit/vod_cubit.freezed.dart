// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VodState {
  Status get status => throw _privateConstructorUsedError;
  Status get categoryStatus => throw _privateConstructorUsedError;
  Status get countryStatus => throw _privateConstructorUsedError;
  Map<String, List<VodModel>> get videos => throw _privateConstructorUsedError;
  List<CountryModel> get countries => throw _privateConstructorUsedError;
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  List<int> get savedVideos => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get categoryError => throw _privateConstructorUsedError;
  String? get countryError => throw _privateConstructorUsedError;
  VodModel get selectedVideo => throw _privateConstructorUsedError;
  int? get selectedCategoryId => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;

  /// Create a copy of VodState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VodStateCopyWith<VodState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VodStateCopyWith<$Res> {
  factory $VodStateCopyWith(VodState value, $Res Function(VodState) then) =
      _$VodStateCopyWithImpl<$Res, VodState>;
  @useResult
  $Res call(
      {Status status,
      Status categoryStatus,
      Status countryStatus,
      Map<String, List<VodModel>> videos,
      List<CountryModel> countries,
      List<CategoryModel> categories,
      List<int> savedVideos,
      String? error,
      String? categoryError,
      String? countryError,
      VodModel selectedVideo,
      int? selectedCategoryId,
      bool isPlaying});

  $VodModelCopyWith<$Res> get selectedVideo;
}

/// @nodoc
class _$VodStateCopyWithImpl<$Res, $Val extends VodState>
    implements $VodStateCopyWith<$Res> {
  _$VodStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VodState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? categoryStatus = null,
    Object? countryStatus = null,
    Object? videos = null,
    Object? countries = null,
    Object? categories = null,
    Object? savedVideos = null,
    Object? error = freezed,
    Object? categoryError = freezed,
    Object? countryError = freezed,
    Object? selectedVideo = null,
    Object? selectedCategoryId = freezed,
    Object? isPlaying = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      categoryStatus: null == categoryStatus
          ? _value.categoryStatus
          : categoryStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      countryStatus: null == countryStatus
          ? _value.countryStatus
          : countryStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      videos: null == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as Map<String, List<VodModel>>,
      countries: null == countries
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<CountryModel>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      savedVideos: null == savedVideos
          ? _value.savedVideos
          : savedVideos // ignore: cast_nullable_to_non_nullable
              as List<int>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryError: freezed == categoryError
          ? _value.categoryError
          : categoryError // ignore: cast_nullable_to_non_nullable
              as String?,
      countryError: freezed == countryError
          ? _value.countryError
          : countryError // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedVideo: null == selectedVideo
          ? _value.selectedVideo
          : selectedVideo // ignore: cast_nullable_to_non_nullable
              as VodModel,
      selectedCategoryId: freezed == selectedCategoryId
          ? _value.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of VodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodModelCopyWith<$Res> get selectedVideo {
    return $VodModelCopyWith<$Res>(_value.selectedVideo, (value) {
      return _then(_value.copyWith(selectedVideo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VodStateImplCopyWith<$Res>
    implements $VodStateCopyWith<$Res> {
  factory _$$VodStateImplCopyWith(
          _$VodStateImpl value, $Res Function(_$VodStateImpl) then) =
      __$$VodStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      Status categoryStatus,
      Status countryStatus,
      Map<String, List<VodModel>> videos,
      List<CountryModel> countries,
      List<CategoryModel> categories,
      List<int> savedVideos,
      String? error,
      String? categoryError,
      String? countryError,
      VodModel selectedVideo,
      int? selectedCategoryId,
      bool isPlaying});

  @override
  $VodModelCopyWith<$Res> get selectedVideo;
}

/// @nodoc
class __$$VodStateImplCopyWithImpl<$Res>
    extends _$VodStateCopyWithImpl<$Res, _$VodStateImpl>
    implements _$$VodStateImplCopyWith<$Res> {
  __$$VodStateImplCopyWithImpl(
      _$VodStateImpl _value, $Res Function(_$VodStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VodState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? categoryStatus = null,
    Object? countryStatus = null,
    Object? videos = null,
    Object? countries = null,
    Object? categories = null,
    Object? savedVideos = null,
    Object? error = freezed,
    Object? categoryError = freezed,
    Object? countryError = freezed,
    Object? selectedVideo = null,
    Object? selectedCategoryId = freezed,
    Object? isPlaying = null,
  }) {
    return _then(_$VodStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      categoryStatus: null == categoryStatus
          ? _value.categoryStatus
          : categoryStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      countryStatus: null == countryStatus
          ? _value.countryStatus
          : countryStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      videos: null == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as Map<String, List<VodModel>>,
      countries: null == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<CountryModel>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      savedVideos: null == savedVideos
          ? _value._savedVideos
          : savedVideos // ignore: cast_nullable_to_non_nullable
              as List<int>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryError: freezed == categoryError
          ? _value.categoryError
          : categoryError // ignore: cast_nullable_to_non_nullable
              as String?,
      countryError: freezed == countryError
          ? _value.countryError
          : countryError // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedVideo: null == selectedVideo
          ? _value.selectedVideo
          : selectedVideo // ignore: cast_nullable_to_non_nullable
              as VodModel,
      selectedCategoryId: freezed == selectedCategoryId
          ? _value.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$VodStateImpl extends _VodState {
  const _$VodStateImpl(
      {this.status = Status.initial,
      this.categoryStatus = Status.initial,
      this.countryStatus = Status.initial,
      final Map<String, List<VodModel>> videos = const {},
      final List<CountryModel> countries = const [],
      final List<CategoryModel> categories = const [],
      final List<int> savedVideos = const [],
      this.error,
      this.categoryError,
      this.countryError,
      this.selectedVideo = VodModel.empty,
      this.selectedCategoryId = null,
      this.isPlaying = false})
      : _videos = videos,
        _countries = countries,
        _categories = categories,
        _savedVideos = savedVideos,
        super._();

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final Status categoryStatus;
  @override
  @JsonKey()
  final Status countryStatus;
  final Map<String, List<VodModel>> _videos;
  @override
  @JsonKey()
  Map<String, List<VodModel>> get videos {
    if (_videos is EqualUnmodifiableMapView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_videos);
  }

  final List<CountryModel> _countries;
  @override
  @JsonKey()
  List<CountryModel> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  final List<CategoryModel> _categories;
  @override
  @JsonKey()
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<int> _savedVideos;
  @override
  @JsonKey()
  List<int> get savedVideos {
    if (_savedVideos is EqualUnmodifiableListView) return _savedVideos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedVideos);
  }

  @override
  final String? error;
  @override
  final String? categoryError;
  @override
  final String? countryError;
  @override
  @JsonKey()
  final VodModel selectedVideo;
  @override
  @JsonKey()
  final int? selectedCategoryId;
  @override
  @JsonKey()
  final bool isPlaying;

  @override
  String toString() {
    return 'VodState(status: $status, categoryStatus: $categoryStatus, countryStatus: $countryStatus, videos: $videos, countries: $countries, categories: $categories, savedVideos: $savedVideos, error: $error, categoryError: $categoryError, countryError: $countryError, selectedVideo: $selectedVideo, selectedCategoryId: $selectedCategoryId, isPlaying: $isPlaying)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VodStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.categoryStatus, categoryStatus) ||
                other.categoryStatus == categoryStatus) &&
            (identical(other.countryStatus, countryStatus) ||
                other.countryStatus == countryStatus) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._savedVideos, _savedVideos) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.categoryError, categoryError) ||
                other.categoryError == categoryError) &&
            (identical(other.countryError, countryError) ||
                other.countryError == countryError) &&
            (identical(other.selectedVideo, selectedVideo) ||
                other.selectedVideo == selectedVideo) &&
            (identical(other.selectedCategoryId, selectedCategoryId) ||
                other.selectedCategoryId == selectedCategoryId) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      categoryStatus,
      countryStatus,
      const DeepCollectionEquality().hash(_videos),
      const DeepCollectionEquality().hash(_countries),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_savedVideos),
      error,
      categoryError,
      countryError,
      selectedVideo,
      selectedCategoryId,
      isPlaying);

  /// Create a copy of VodState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VodStateImplCopyWith<_$VodStateImpl> get copyWith =>
      __$$VodStateImplCopyWithImpl<_$VodStateImpl>(this, _$identity);
}

abstract class _VodState extends VodState {
  const factory _VodState(
      {final Status status,
      final Status categoryStatus,
      final Status countryStatus,
      final Map<String, List<VodModel>> videos,
      final List<CountryModel> countries,
      final List<CategoryModel> categories,
      final List<int> savedVideos,
      final String? error,
      final String? categoryError,
      final String? countryError,
      final VodModel selectedVideo,
      final int? selectedCategoryId,
      final bool isPlaying}) = _$VodStateImpl;
  const _VodState._() : super._();

  @override
  Status get status;
  @override
  Status get categoryStatus;
  @override
  Status get countryStatus;
  @override
  Map<String, List<VodModel>> get videos;
  @override
  List<CountryModel> get countries;
  @override
  List<CategoryModel> get categories;
  @override
  List<int> get savedVideos;
  @override
  String? get error;
  @override
  String? get categoryError;
  @override
  String? get countryError;
  @override
  VodModel get selectedVideo;
  @override
  int? get selectedCategoryId;
  @override
  bool get isPlaying;

  /// Create a copy of VodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VodStateImplCopyWith<_$VodStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
