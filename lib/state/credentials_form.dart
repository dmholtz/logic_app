import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/form_credentials.dart';
import 'package:logic_app/models/form_field.dart';

class CredentialsFormStateNotifier extends StateNotifier<CredentialsForm> {
  CredentialsFormStateNotifier() : super(CredentialsForm.empty());

  void setUsername(String username) {
    if (username.length >= 3 && username.length <= 16) {
      state =
          state.copyWith(username: FormField(value: username, isValid: true));
    } else {
      state =
          state.copyWith(username: FormField(value: username, isValid: false));
    }
  }

  void setPassword(String password) {
    state = state.copyWith(password: FormField(value: password, isValid: true));
  }
}

final credentialsFormProvider =
    StateNotifierProvider<CredentialsFormStateNotifier, CredentialsForm>(
  (ref) => CredentialsFormStateNotifier(),
);
