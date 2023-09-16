import 'dart:convert';
import 'dart:io';

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
      // https://medium.com/wyzetalk-tech/flutter-using-self-signed-ssl-certificates-in-development-c3fe2d104acf
      HttpClient client = HttpClient()
        ..badCertificateCallback =
            ((X509Certificate cert, String host, int port) =>
                host == "localhost");

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

        if (response.statusCode == 201) {
          // Source https://stackoverflow.com/questions/68871880/do-not-use-buildcontexts-across-async-gaps
          if (context.mounted) {
            context.go('/sign-in');
          }
        } else {
          ref
              .read(credentialsFormProvider.notifier)
              .setUsernameError("Username already exists");
          print(response.statusCode);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(offlineSnackbar);
      }

      //var resp = http
      //    .post(
      //      Uri.parse("https://localhost:443/user/signup"),
      //      body: jsonEncode(credentials),
      //      headers: {"Content-Type": "application/json"},
      //    )
      //    .timeout(
      //      const Duration(seconds: 1),
      //    )
      //    .catchError((err) {
      //      print(err);
      //      return Future(() => print("Error"));
      //    })
      //    .then((value) {
      //      if (value.statusCode == 201) {
      //        context.go('/sign-in');
      //      }
      //    })
      //    .onError((error, stackTrace) => throw (error!));

      //resp.then((value) => print(value.statusCode));
      //resp.onError((error, stackTrace) => throw (error!));

      //try {
      //  var request = client
      //      .postUrl(
      //          Uri.parse("https://localhost:443/user/signup"))
      //      .timeout(const Duration(seconds: 5));
      //  request.headers.set('content-type', 'application/json');
      //} on TimeoutException catch (e) {
      //  print('Timeout Error: $e');
      //} on SocketException catch (e) {
      //  print('Socket Error: $e');
      //} on Error catch (e) {
      //  print('General Error: $e');
      //}

      //var req = client.postUrl(
      //    Uri.parse("https://localhost:443/user/signup"));
      //var resp = req
      //    .then((HttpClientRequest request) {
      //      request.headers
      //          .set('content-type', 'application/json');
      //      request.write(jsonEncode(credentials));
      //      return request.close();
      //    })
      //    .timeout(const Duration(seconds: 5))
      //    .onError((error, stackTrace) {
      //      return HttpClientResponse(statusCode: 500);
      //    });
      //resp.then((HttpClientResponse response) {
      //  // Process the response.
      //  print(response.statusCode);
      //  if (response.statusCode == 201) {
      //    context.go('/sign-in');
      //  }
      //  print(response.headers);
      //  response.transform(utf8.decoder).listen((contents) {
      //    print(contents);
      //  });
      //});
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
              "Choose a username and a password to create a new account."),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
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
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Password",
                      label: Text("Password"),
                      helperText: "Must be at least 8 characters long",
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
          )
        ],
      ),
    );
  }
}
