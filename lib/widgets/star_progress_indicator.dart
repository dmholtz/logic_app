import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StarProgressIndicator extends ConsumerWidget {
  // value of the progress indicator, must be between 0 and 1
  final double value;
  final int totalNumberOfStars;

  StarProgressIndicator({
    super.key,
    required this.value,
    this.totalNumberOfStars = 5,
  }) {
    if (totalNumberOfStars < 1) {
      throw ArgumentError("totalNumberOfStars must be positive");
    }
    if (value < 0 || value > 1) {
      throw ArgumentError("value must be between 0 and 1");
    }
  }

  static Widget fullStar = const Icon(Icons.star, color: Colors.amber);
  static Widget halfStar = const Icon(Icons.star_half, color: Colors.amber);
  static Widget emptyStar = const Icon(Icons.star_border, color: Colors.amber);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fullStars = (value * totalNumberOfStars).floor();
    final halfStars = value * totalNumberOfStars - fullStars >= 0.5
        ? fullStars + 1
        : fullStars;
    return Row(
      children: List.generate(
        totalNumberOfStars,
        (index) {
          if (index < fullStars) {
            return fullStar;
          } else if (index < halfStars) {
            return halfStar;
          } else {
            return emptyStar;
          }
        },
      ),
    );
  }
}
