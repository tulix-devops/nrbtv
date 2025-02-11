// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CollectionState {
  Status get status => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get hasMorePages => throw _privateConstructorUsedError;
  List<ContentModel> get contentList => throw _privateConstructorUsedError;
  bool get isLoadingNextPage => throw _privateConstructorUsedError;
  List<CollectionModel> get collectionListModel =>
      throw _privateConstructorUsedError;
  List<CollectionModel> get mainPageList => throw _privateConstructorUsedError;

  /// Create a copy of CollectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionStateCopyWith<CollectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionStateCopyWith<$Res> {
  factory $CollectionStateCopyWith(
          CollectionState value, $Res Function(CollectionState) then) =
      _$CollectionStateCopyWithImpl<$Res, CollectionState>;
  @useResult
  $Res call(
      {Status status,
      int page,
      bool hasMorePages,
      List<ContentModel> contentList,
      bool isLoadingNextPage,
      List<CollectionModel> collectionListModel,
      List<CollectionModel> mainPageList});
}

/// @nodoc
class _$CollectionStateCopyWithImpl<$Res, $Val extends CollectionState>
    implements $CollectionStateCopyWith<$Res> {
  _$CollectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? page = null,
    Object? hasMorePages = null,
    Object? contentList = null,
    Object? isLoadingNextPage = null,
    Object? collectionListModel = null,
    Object? mainPageList = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasMorePages: null == hasMorePages
          ? _value.hasMorePages
          : hasMorePages // ignore: cast_nullable_to_non_nullable
              as bool,
      contentList: null == contentList
          ? _value.contentList
          : contentList // ignore: cast_nullable_to_non_nullable
              as List<ContentModel>,
      isLoadingNextPage: null == isLoadingNextPage
          ? _value.isLoadingNextPage
          : isLoadingNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      collectionListModel: null == collectionListModel
          ? _value.collectionListModel
          : collectionListModel // ignore: cast_nullable_to_non_nullable
              as List<CollectionModel>,
      mainPageList: null == mainPageList
          ? _value.mainPageList
          : mainPageList // ignore: cast_nullable_to_non_nullable
              as List<CollectionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionStateImplCopyWith<$Res>
    implements $CollectionStateCopyWith<$Res> {
  factory _$$CollectionStateImplCopyWith(_$CollectionStateImpl value,
          $Res Function(_$CollectionStateImpl) then) =
      __$$CollectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      int page,
      bool hasMorePages,
      List<ContentModel> contentList,
      bool isLoadingNextPage,
      List<CollectionModel> collectionListModel,
      List<CollectionModel> mainPageList});
}

/// @nodoc
class __$$CollectionStateImplCopyWithImpl<$Res>
    extends _$CollectionStateCopyWithImpl<$Res, _$CollectionStateImpl>
    implements _$$CollectionStateImplCopyWith<$Res> {
  __$$CollectionStateImplCopyWithImpl(
      _$CollectionStateImpl _value, $Res Function(_$CollectionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? page = null,
    Object? hasMorePages = null,
    Object? contentList = null,
    Object? isLoadingNextPage = null,
    Object? collectionListModel = null,
    Object? mainPageList = null,
  }) {
    return _then(_$CollectionStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasMorePages: null == hasMorePages
          ? _value.hasMorePages
          : hasMorePages // ignore: cast_nullable_to_non_nullable
              as bool,
      contentList: null == contentList
          ? _value._contentList
          : contentList // ignore: cast_nullable_to_non_nullable
              as List<ContentModel>,
      isLoadingNextPage: null == isLoadingNextPage
          ? _value.isLoadingNextPage
          : isLoadingNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      collectionListModel: null == collectionListModel
          ? _value._collectionListModel
          : collectionListModel // ignore: cast_nullable_to_non_nullable
              as List<CollectionModel>,
      mainPageList: null == mainPageList
          ? _value._mainPageList
          : mainPageList // ignore: cast_nullable_to_non_nullable
              as List<CollectionModel>,
    ));
  }
}

/// @nodoc

class _$CollectionStateImpl extends _CollectionState {
  const _$CollectionStateImpl(
      {this.status = Status.initial,
      this.page = 1,
      this.hasMorePages = true,
      final List<ContentModel> contentList = const [],
      this.isLoadingNextPage = false,
      final List<CollectionModel> collectionListModel = const [],
      final List<CollectionModel> mainPageList = const []})
      : _contentList = contentList,
        _collectionListModel = collectionListModel,
        _mainPageList = mainPageList,
        super._();

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool hasMorePages;
  final List<ContentModel> _contentList;
  @override
  @JsonKey()
  List<ContentModel> get contentList {
    if (_contentList is EqualUnmodifiableListView) return _contentList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contentList);
  }

  @override
  @JsonKey()
  final bool isLoadingNextPage;
  final List<CollectionModel> _collectionListModel;
  @override
  @JsonKey()
  List<CollectionModel> get collectionListModel {
    if (_collectionListModel is EqualUnmodifiableListView)
      return _collectionListModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collectionListModel);
  }

  final List<CollectionModel> _mainPageList;
  @override
  @JsonKey()
  List<CollectionModel> get mainPageList {
    if (_mainPageList is EqualUnmodifiableListView) return _mainPageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mainPageList);
  }

  @override
  String toString() {
    return 'CollectionState(status: $status, page: $page, hasMorePages: $hasMorePages, contentList: $contentList, isLoadingNextPage: $isLoadingNextPage, collectionListModel: $collectionListModel, mainPageList: $mainPageList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.hasMorePages, hasMorePages) ||
                other.hasMorePages == hasMorePages) &&
            const DeepCollectionEquality()
                .equals(other._contentList, _contentList) &&
            (identical(other.isLoadingNextPage, isLoadingNextPage) ||
                other.isLoadingNextPage == isLoadingNextPage) &&
            const DeepCollectionEquality()
                .equals(other._collectionListModel, _collectionListModel) &&
            const DeepCollectionEquality()
                .equals(other._mainPageList, _mainPageList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      page,
      hasMorePages,
      const DeepCollectionEquality().hash(_contentList),
      isLoadingNextPage,
      const DeepCollectionEquality().hash(_collectionListModel),
      const DeepCollectionEquality().hash(_mainPageList));

  /// Create a copy of CollectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionStateImplCopyWith<_$CollectionStateImpl> get copyWith =>
      __$$CollectionStateImplCopyWithImpl<_$CollectionStateImpl>(
          this, _$identity);
}

abstract class _CollectionState extends CollectionState {
  const factory _CollectionState(
      {final Status status,
      final int page,
      final bool hasMorePages,
      final List<ContentModel> contentList,
      final bool isLoadingNextPage,
      final List<CollectionModel> collectionListModel,
      final List<CollectionModel> mainPageList}) = _$CollectionStateImpl;
  const _CollectionState._() : super._();

  @override
  Status get status;
  @override
  int get page;
  @override
  bool get hasMorePages;
  @override
  List<ContentModel> get contentList;
  @override
  bool get isLoadingNextPage;
  @override
  List<CollectionModel> get collectionListModel;
  @override
  List<CollectionModel> get mainPageList;

  /// Create a copy of CollectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionStateImplCopyWith<_$CollectionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
