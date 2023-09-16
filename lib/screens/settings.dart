import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:logic_app/state/access_token.dart';
import 'package:logic_app/widgets/offline_snackbar.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logout() async {
      try {
        final response = await http
            .post(Uri.parse("https://localhost:443/user/logout"), headers: {
          "Authorization": "Bearer ${await ref.read(accessTokenProvider)}"
        });

        if (response.statusCode == 200) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Row(
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text("Successfully logged out"),
              ],
            )));
          }
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(offlineSnackbar);
      }

      // always clear the access token
      ref.read(accessTokenStateNotifierProvider.notifier).deleteAccessToken();
      if (context.mounted) {
        context.go('/');
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
