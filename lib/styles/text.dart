import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

TextStyle tableHeadlineTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.bold,
      );
}

TextStyle tableContentTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodyMedium!;
}

TextStyle countdownTextStyle(
    BuildContext context, WidgetRef ref, double seconds) {
  return Theme.of(context).textTheme.bodyLarge!.copyWith(
      fontWeight: FontWeight.bold,
      color: seconds < 3 ? Colors.red : Colors.black,
      // Improve the readability of the countdown by using tabular figures
      // Source: https://api.flutter.dev/flutter/dart-ui/FontFeature/FontFeature.tabularFigures.html
      fontFeatures: [const FontFeature.tabularFigures()]);
}
