// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return _CustomerModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerModel {
  int get id => throw _privateConstructorUsedError;
  int? get statusId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CustomerModelImpl
    with DiagnosticableTreeMixin
    implements _CustomerModel {
  const _$CustomerModelImpl(
      {required this.id, required this.statusId, required this.email});

  factory _$CustomerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerModelImplFromJson(json);

  @override
  final int id;
  @override
  final int? statusId;
  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CustomerModel(id: $id, statusId: $statusId, email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CustomerModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('statusId', statusId))
      ..add(DiagnosticsProperty('email', email));
  }
}

abstract class _CustomerModel implements CustomerModel {
  const factory _CustomerModel(
      {required final int id,
      required final int? statusId,
      required final String email}) = _$CustomerModelImpl;

  factory _CustomerModel.fromJson(Map<String, dynamic> json) =
      _$CustomerModelImpl.fromJson;

  @override
  int get id;
  @override
  int? get statusId;
  @override
  String get email;
}

LoginEntity _$LoginEntityFromJson(Map<String, dynamic> json) {
  return _LoginEntity.fromJson(json);
}

/// @nodoc
mixin _$LoginEntity {
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  CustomerModel get user => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$LoginEntityImpl with DiagnosticableTreeMixin implements _LoginEntity {
  const _$LoginEntityImpl(
      {required this.accessToken,
      @JsonKey(includeToJson: false) required this.user});

  factory _$LoginEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginEntityImplFromJson(json);

  @override
  final String accessToken;
  @override
  @JsonKey(includeToJson: false)
  final CustomerModel user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginEntity(accessToken: $accessToken, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginEntity'))
      ..add(DiagnosticsProperty('accessToken', accessToken))
      ..add(DiagnosticsProperty('user', user));
  }
}

abstract class _LoginEntity implements LoginEntity {
  const factory _LoginEntity(
          {required final String accessToken,
          @JsonKey(includeToJson: false) required final CustomerModel user}) =
      _$LoginEntityImpl;

  factory _LoginEntity.fromJson(Map<String, dynamic> json) =
      _$LoginEntityImpl.fromJson;

  @override
  String get accessToken;
  @override
  @JsonKey(includeToJson: false)
  CustomerModel get user;
}

SignUpEntity _$SignUpEntityFromJson(Map<String, dynamic> json) {
  return _SignUpEntity.fromJson(json);
}

/// @nodoc
mixin _$SignUpEntity {
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  CustomerModel get customer => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$SignUpEntityImpl with DiagnosticableTreeMixin implements _SignUpEntity {
  const _$SignUpEntityImpl(
      {required this.accessToken,
      @JsonKey(includeToJson: false) required this.customer});

  factory _$SignUpEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpEntityImplFromJson(json);

  @override
  final String accessToken;
  @override
  @JsonKey(includeToJson: false)
  final CustomerModel customer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpEntity(accessToken: $accessToken, customer: $customer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpEntity'))
      ..add(DiagnosticsProperty('accessToken', accessToken))
      ..add(DiagnosticsProperty('customer', customer));
  }
}

abstract class _SignUpEntity implements SignUpEntity {
  const factory _SignUpEntity(
      {required final String accessToken,
      @JsonKey(includeToJson: false)
      required final CustomerModel customer}) = _$SignUpEntityImpl;

  factory _SignUpEntity.fromJson(Map<String, dynamic> json) =
      _$SignUpEntityImpl.fromJson;

  @override
  String get accessToken;
  @override
  @JsonKey(includeToJson: false)
  CustomerModel get customer;
}
