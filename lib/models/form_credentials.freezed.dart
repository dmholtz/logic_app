// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CredentialsForm {
  FormField get username => throw _privateConstructorUsedError;
  FormField get password => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CredentialsFormCopyWith<CredentialsForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialsFormCopyWith<$Res> {
  factory $CredentialsFormCopyWith(
          CredentialsForm value, $Res Function(CredentialsForm) then) =
      _$CredentialsFormCopyWithImpl<$Res, CredentialsForm>;
  @useResult
  $Res call({FormField username, FormField password, String errorMessage});

  $FormFieldCopyWith<$Res> get username;
  $FormFieldCopyWith<$Res> get password;
}

/// @nodoc
class _$CredentialsFormCopyWithImpl<$Res, $Val extends CredentialsForm>
    implements $CredentialsFormCopyWith<$Res> {
  _$CredentialsFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as FormField,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as FormField,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FormFieldCopyWith<$Res> get username {
    return $FormFieldCopyWith<$Res>(_value.username, (value) {
      return _then(_value.copyWith(username: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FormFieldCopyWith<$Res> get password {
    return $FormFieldCopyWith<$Res>(_value.password, (value) {
      return _then(_value.copyWith(password: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CredentialsFormCopyWith<$Res>
    implements $CredentialsFormCopyWith<$Res> {
  factory _$$_CredentialsFormCopyWith(
          _$_CredentialsForm value, $Res Function(_$_CredentialsForm) then) =
      __$$_CredentialsFormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormField username, FormField password, String errorMessage});

  @override
  $FormFieldCopyWith<$Res> get username;
  @override
  $FormFieldCopyWith<$Res> get password;
}

/// @nodoc
class __$$_CredentialsFormCopyWithImpl<$Res>
    extends _$CredentialsFormCopyWithImpl<$Res, _$_CredentialsForm>
    implements _$$_CredentialsFormCopyWith<$Res> {
  __$$_CredentialsFormCopyWithImpl(
      _$_CredentialsForm _value, $Res Function(_$_CredentialsForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_CredentialsForm(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as FormField,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as FormField,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CredentialsForm extends _CredentialsForm {
  const _$_CredentialsForm(
      {required this.username, required this.password, this.errorMessage = ""})
      : super._();

  @override
  final FormField username;
  @override
  final FormField password;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'CredentialsForm(username: $username, password: $password, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CredentialsForm &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, username, password, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CredentialsFormCopyWith<_$_CredentialsForm> get copyWith =>
      __$$_CredentialsFormCopyWithImpl<_$_CredentialsForm>(this, _$identity);
}

abstract class _CredentialsForm extends CredentialsForm {
  const factory _CredentialsForm(
      {required final FormField username,
      required final FormField password,
      final String errorMessage}) = _$_CredentialsForm;
  const _CredentialsForm._() : super._();

  @override
  FormField get username;
  @override
  FormField get password;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_CredentialsFormCopyWith<_$_CredentialsForm> get copyWith =>
      throw _privateConstructorUsedError;
}
