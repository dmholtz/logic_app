import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:logic_app/state/access_token.dart';
import 'package:logic_app/state/app_tour.dart';
import 'package:logic_app/state/credentials_form.dart';
import 'package:logic_app/widgets/offline_snackbar.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    login() async {
      // Extract the username and password from the form and build a JSON object
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

        // check the response code to see if login was successful
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
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(offlineSnackbar);
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Log In")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.login, size: 100),
              Text(
                "Provide your username and a password to log in into your account.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Choose a username",
                        label: Text("Username"),
                      ),
                      onChanged: (value) {
                        ref
                            .read(credentialsFormProvider.notifier)
                            .setUsername(value);
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        label: const Text("Password"),
                        helperText:
                            ref.watch(credentialsFormProvider).errorMessage,
                        helperStyle: const TextStyle(color: Colors.red),
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        ref
                            .read(credentialsFormProvider.notifier)
                            .setPassword(value);
                      },
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: login,
                      child: const Text("Log In"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Need an account?"),
                  const SizedBox(width: 10),
                  GestureDetector(
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      context.pushReplacement('/sign-up');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
