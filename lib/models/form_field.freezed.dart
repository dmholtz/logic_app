// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormField {
  String get value => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormFieldCopyWith<FormField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormFieldCopyWith<$Res> {
  factory $FormFieldCopyWith(FormField value, $Res Function(FormField) then) =
      _$FormFieldCopyWithImpl<$Res, FormField>;
  @useResult
  $Res call({String value, bool isValid});
}

/// @nodoc
class _$FormFieldCopyWithImpl<$Res, $Val extends FormField>
    implements $FormFieldCopyWith<$Res> {
  _$FormFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FormFieldCopyWith<$Res> implements $FormFieldCopyWith<$Res> {
  factory _$$_FormFieldCopyWith(
          _$_FormField value, $Res Function(_$_FormField) then) =
      __$$_FormFieldCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, bool isValid});
}

/// @nodoc
class __$$_FormFieldCopyWithImpl<$Res>
    extends _$FormFieldCopyWithImpl<$Res, _$_FormField>
    implements _$$_FormFieldCopyWith<$Res> {
  __$$_FormFieldCopyWithImpl(
      _$_FormField _value, $Res Function(_$_FormField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? isValid = null,
  }) {
    return _then(_$_FormField(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FormField implements _FormField {
  const _$_FormField({required this.value, this.isValid = false});

  @override
  final String value;
  @override
  @JsonKey()
  final bool isValid;

  @override
  String toString() {
    return 'FormField(value: $value, isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormField &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormFieldCopyWith<_$_FormField> get copyWith =>
      __$$_FormFieldCopyWithImpl<_$_FormField>(this, _$identity);
}

abstract class _FormField implements FormField {
  const factory _FormField({required final String value, final bool isValid}) =
      _$_FormField;

  @override
  String get value;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$_FormFieldCopyWith<_$_FormField> get copyWith =>
      throw _privateConstructorUsedError;
}
