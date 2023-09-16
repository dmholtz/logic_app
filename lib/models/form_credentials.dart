import "package:freezed_annotation/freezed_annotation.dart";
import "package:logic_app/models/form_field.dart";

part 'form_credentials.freezed.dart';

// Source: https://medium.com/@theaayushbhattarai/form-validation-using-riverpod-4e0f902331af

@freezed
class CredentialsForm with _$CredentialsForm {
  const CredentialsForm._();
  const factory CredentialsForm({
    required FormField username,
    required FormField password,
    @Default("") String errorMessage,
  }) = _CredentialsForm;

  factory CredentialsForm.empty() => const CredentialsForm(
        username: FormField(value: ""),
        password: FormField(value: ""),
      );

  bool get isValid => username.isValid && password.isValid;
}
