import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:logic_app/state/access_token.dart';
import 'package:logic_app/widgets/snackbars.dart';

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
            ScaffoldMessenger.of(context).showSnackBar(logoutSnackbar);
          }
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(offlineSnackbar);
      }

      // always clear the access token
      ref.read(accessTokenStateNotifierProvider.notifier).deleteAccessToken();

      // navigate to the welcome screen
      if (context.mounted) {
        context.go('/');
      }
    }

    reset() async {
      try {
        final response = await http
            .post(Uri.parse("https://localhost:443/user/reset"), headers: {
          "Authorization": "Bearer ${await ref.read(accessTokenProvider)}"
        });

        if (response.statusCode == 200) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(resetProgressSnackbar);
          }
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(offlineSnackbar);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: [
            CupertinoListSection.insetGrouped(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              footer: Text(
                "The app tour will guide you through the app's features.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              children: [
                CupertinoListTile(
                  title: const Text("App Tour"),
                  trailing: const Icon(Icons.tour),
                  onTap: () {
                    context.go('/app-tour');
                  },
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              footer: Text(
                "Reset will delete the achievements and all points won in competition mode.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              children: [
                CupertinoListTile(
                  title: Text(
                    "Reset Progress",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.red),
                  ),
                  trailing: const Icon(Icons.restore),
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: const Text("Reset Progress"),
                        content: const Text(
                            "Are you sure you want to reset all achievements and points? This action cannot be undone."),
                        actions: <CupertinoDialogAction>[
                          CupertinoDialogAction(
                            isDefaultAction: true, // action text is bold
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel"),
                          ),
                          CupertinoDialogAction(
                            isDestructiveAction: true, // action text is red
                            onPressed: () {
                              reset();
                              Navigator.pop(context);
                            },
                            child: const Text("Confirm Reset"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              footer: Text(
                "Logout from the app. You can re-login at any time and will be able to continue where you left off.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              children: [
                CupertinoListTile(
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.logout),
                  onTap: logout,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
