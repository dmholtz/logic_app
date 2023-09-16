import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/form_credentials.dart';
import 'package:logic_app/models/form_field.dart';

// Implements form validation using Riverpod
// Adapted from source: https://medium.com/@theaayushbhattarai/form-validation-using-riverpod-4e0f902331af
class CredentialsFormStateNotifier extends StateNotifier<CredentialsForm> {
  static final RegExp _usernameRegex = RegExp(r"^[a-zA-Z0-9]+$");

  CredentialsFormStateNotifier() : super(CredentialsForm.empty());

  void setUsername(String username) {
    if (username.length < 3) {
      state = state.copyWith(
          username: FormField(
        value: username,
        isValid: false,
        errorMessage: "Username must be at least 3 characters long",
      ));
    } else if (username.length > 12) {
      state = state.copyWith(
          username: FormField(
        value: username,
        isValid: false,
        errorMessage: "Username must be at most 12 characters long",
      ));
    } else if (_usernameRegex.firstMatch(username) == null) {
      state = state.copyWith(
          username: FormField(
        value: username,
        isValid: false,
        errorMessage: "Only letters (a-z, A-Z) and digits (0-9) are allowed",
      ));
    } else {
      state =
          state.copyWith(username: FormField(value: username, isValid: true));
    }
  }

  void setUsernameError(String errorMessage) {
    state = state.copyWith(
        username: FormField(
            value: state.username.value,
            isValid: false,
            errorMessage: errorMessage));
  }

  void setPassword(String password) {
    state = state.copyWith(password: FormField(value: password, isValid: true));
  }

  void setErrorMessage(String errorMessage) {
    state = state.copyWith(errorMessage: errorMessage);
  }

  void resetForm() {
    state = CredentialsForm.empty();
  }
}

final credentialsFormProvider =
    StateNotifierProvider<CredentialsFormStateNotifier, CredentialsForm>(
  (ref) => CredentialsFormStateNotifier(),
);
