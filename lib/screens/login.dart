import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:logic_app/state/access_token.dart';
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

        if (response.statusCode == 200) {
          String accessToken = response.body;
          ref.read(accessTokenProvider.notifier).setAccessToken(accessToken);
          if (context.mounted) {
            context.go('/app-tour');
          }
        } else {
          print(response.statusCode);
        }
      } on TimeoutException {
        print("Timeout");
      } on SocketException {
        print("Socket");
      } on Error {
        print("Error");
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
                ElevatedButton(
                  onPressed: login,
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
