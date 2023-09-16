import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logic_app/state/access_token.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    checkToken() async {
      String token = await ref.watch(accessTokenProvider);
      print(token);
      if (token != "") {
        if (context.mounted) {
          context.go('/practice');
        }
      } else {
        if (context.mounted) {
          context.go('/log-in');
        }
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Welcome to the Logic App!",
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            Column(children: [
              ElevatedButton(
                onPressed: () {
                  checkToken();
                },
                child: const Text("Sign In"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.push('/sign-up');
                },
                child: const Text("Sign Up"),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
