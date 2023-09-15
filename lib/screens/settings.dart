import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:logic_app/state/access_token.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logout() async {
      try {
        final response = await http
            .post(Uri.parse("https://localhost:443/user/logout"), headers: {
          "Authorization": "Bearer ${ref.read(accessTokenProvider)}"
        });

        if (response.statusCode == 200) {
          String accessToken = response.body;
          ref.read(accessTokenProvider.notifier).setAccessToken("");
          if (context.mounted) {
            context.go('/');
          }
        } else {
          print(response.statusCode);
          print(response.body);
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
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Settings'),
            ElevatedButton(
              onPressed: () {
                context.go('/app-tour');
              },
              child: const Text("App Tour"),
            ),
            ElevatedButton(
              onPressed: logout,
              child: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
