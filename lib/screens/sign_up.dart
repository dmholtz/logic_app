import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:logic_app/state/credentials_form.dart';
import 'package:logic_app/widgets/offline_snackbar.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    signup() async {
      // Extract credentials from the form and build a JSON object
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
            Uri.parse("https://localhost:443/user/signup"),
            body: jsonEncode(credentials),
            headers: {"Content-Type": "application/json"});

        // check the response code to see if signup was successful
        if (response.statusCode == 201) {
          if (context.mounted) {
            // Source https://stackoverflow.com/questions/68871880/do-not-use-buildcontexts-across-async-gaps
            context.go('/sign-in');
          }
        } else {
          ref
              .read(credentialsFormProvider.notifier)
              .setUsernameError("Username already exists");
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(offlineSnackbar);
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.person_add, size: 100),
              Text(
                "Choose a username and a password to create a new account.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Choose a username",
                        label: const Text("Username"),
                        helperText: ref
                            .watch(credentialsFormProvider)
                            .username
                            .errorMessage,
                        helperStyle: const TextStyle(color: Colors.red),
                      ),
                      onChanged: (value) {
                        ref
                            .read(credentialsFormProvider.notifier)
                            .setUsername(value);
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Password",
                        label: Text("Password"),
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
                      onPressed: ref.watch(credentialsFormProvider).isValid
                          ? signup
                          : null,
                      child: const Text("Sign Up"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(width: 10),
                  GestureDetector(
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      context.pushReplacement('/sign-in');
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
