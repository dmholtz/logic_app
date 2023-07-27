import 'package:flutter/material.dart';

TextStyle tableHeadlineTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.bold,
      );
}

TextStyle tableContentTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodyMedium!;
}
