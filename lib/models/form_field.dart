import "package:freezed_annotation/freezed_annotation.dart";

part 'form_field.freezed.dart';

// Source: https://medium.com/@theaayushbhattarai/form-validation-using-riverpod-4e0f902331af

@freezed
class FormField with _$FormField {
  const factory FormField({
    required String value,
    @Default(false) bool isValid,
  }) = _FormField;
}
