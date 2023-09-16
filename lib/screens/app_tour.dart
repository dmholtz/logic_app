import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logic_app/state/app_tour.dart';
import 'package:logic_app/state/navigation.dart';
import 'package:logic_app/widgets/app_tour_card.dart';
import 'package:logic_app/widgets/dot_progress_indicator.dart';

// Design inspired from onboardings screens by Marton Szots
// Source: https://dribbble.com/shots/14292358-Vincent-Onboarding
class AppTourScreen extends ConsumerWidget {
  const AppTourScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController controller = PageController(
      initialPage: ref.watch(currentAppTourCardProvider),
      keepPage: false,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Tour'),
        actions: [
          TextButton(
              onPressed: () {
                // save the fact that the user has seen the app tour
                ref.read(appTourSeenProvider.notifier).setAppTourSeen();

                context.go("/practice");
                // this is a hack to reset the navigation bar
                ref.read(activeNavBarProvider.notifier).setSelectedScreen(0);
              },
              child: const Text("Skip"))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) => ref
                  .watch(currentAppTourCardProvider.notifier)
                  .setActiveCard(value),
              children: List.from(
                ref.watch(appTourContentProvider).map(
                      (c) => AppTourCard(content: c),
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DotProgressIndicator(
                  numberOfDots: ref.watch(appTourContentProvider).length,
                  currentDot: ref.watch(currentAppTourCardProvider),
                ),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      if (ref.watch(currentAppTourCardProvider) ==
                          ref.watch(appTourContentProvider).length - 1) {
                        // save the fact that the user has seen the app tour
                        ref.read(appTourSeenProvider.notifier).setAppTourSeen();

                        context.go("/practice");
                        // this is a hack to reset the navigation bar
                        ref
                            .read(activeNavBarProvider.notifier)
                            .setSelectedScreen(0);
                        ref
                            .read(currentAppTourCardProvider.notifier)
                            .setActiveCard(0);
                      } else {
                        ref
                            .read(currentAppTourCardProvider.notifier)
                            .nextCard();
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutCubic);
                      }
                    },
                    // create a circular elevated button:
                    // Source: https://www.fluttercampus.com/guide/290/border-radius-circular-elevated-button/
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        padding: const EdgeInsets.all(0),
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor:
                            Theme.of(context).secondaryHeaderColor),
                    child: const Icon(Icons.arrow_forward, size: 30),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
