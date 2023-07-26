import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StarProgressIndicator extends ConsumerWidget {
  final int currentNumberOfStars;
  final int totalNumberOfStars;

  StarProgressIndicator({
    super.key,
    required this.currentNumberOfStars,
    this.totalNumberOfStars = 5,
  }) {
    if (totalNumberOfStars < 1) {
      throw ArgumentError("totalNumberOfStars must be positive");
    }
    if (currentNumberOfStars < 0 || currentNumberOfStars > totalNumberOfStars) {
      throw ArgumentError(
          "currentNumberOfStars must be greater than 0 and less than or equal to totalNumberOfStars");
    }
  }

  static Widget filledStar = const Icon(
    Icons.star,
    color: Color.fromRGBO(251, 202, 27, 1),
  );
  static Widget emptyStar = const Icon(Icons.star_border);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: List.generate(
        totalNumberOfStars,
        (index) => index + 1 <= currentNumberOfStars ? filledStar : emptyStar,
      ),
    );
  }
}
