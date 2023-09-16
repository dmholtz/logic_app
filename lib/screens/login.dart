import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:logic_app/state/access_token.dart';
import 'package:logic_app/state/app_tour.dart';
import 'package:logic_app/state/credentials_form.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    login() async {
      var username =
          ref.watch(credentialsFormProvider.select((value) => value.username));
      var password =
          ref.watch(credentialsFormProvider.select((value) => value.password));
      Map<String, dynamic> credentials = {
        "username": username.value,
        "password": password.value
      };

      try {
        final response = await http.post(
            Uri.parse("https://localhost:443/user/login"),
            body: jsonEncode(credentials),
            headers: {"Content-Type": "application/json"});

        print(response.statusCode);
        print(response.body);

        if (response.statusCode == 200) {
          // save the access token
          String accessToken = response.body;
          ref
              .read(accessTokenStateNotifierProvider.notifier)
              .setAccessToken(accessToken);
          // reset the form
          ref.read(credentialsFormProvider.notifier).resetForm();

          // navigate to the app tour or practice screen
          if (context.mounted) {
            // only show the AppTour if the user has not seen it before
            if (ref.watch(appTourSeenProvider) == false) {
              context.go('/app-tour');
            } else {
              context.go('/practice');
            }
          }
        } else {
          // reset the password field
          ref.read(credentialsFormProvider.notifier).setPassword("");
          // display the error message from server
          ref
              .read(credentialsFormProvider.notifier)
              .setErrorMessage(response.body);
        }
      } on TimeoutException {
        print("Timeout");
      } on SocketException {
        print("Socket");
      } on Error {
        print("Error");
      }
    }

    checkToken() async {
      String token = await ref.watch(accessTokenProvider);
      if (token != "") {
        if (context.mounted) {
          context.go('/practice');
        }
      } else {
        login();
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Log In")),
      body: Column(
        children: [
          Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter your username",
                    label: Text("Username"),
                  ),
                  onChanged: (value) {
                    ref
                        .read(credentialsFormProvider.notifier)
                        .setUsername(value);
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter your password",
                    label: Text("Password"),
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    ref
                        .read(credentialsFormProvider.notifier)
                        .setPassword(value);
                  },
                ),
                ref.watch(credentialsFormProvider).errorMessage != ""
                    ? Text(
                        ref.watch(credentialsFormProvider).errorMessage,
                        style: const TextStyle(color: Colors.red),
                      )
                    : const SizedBox(height: 0),
                ElevatedButton(
                  onPressed: checkToken,
                  child: const Text("Log In"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
