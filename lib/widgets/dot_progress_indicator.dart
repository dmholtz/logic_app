import 'package:flutter/material.dart';

class DotProgressIndicator extends StatelessWidget {
  final int numberOfDots;
  final int currentDot;

  DotProgressIndicator({
    super.key,
    required this.numberOfDots,
    required this.currentDot,
  }) {
    if (numberOfDots < 2) {
      throw ArgumentError("numberOfDots must be greater than 1");
    }
    if (currentDot < 0 || currentDot > numberOfDots - 1) {
      throw ArgumentError(
          "currentDot must be greater than 0 and less than numberOfDots");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        numberOfDots,
        (index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            Icons.circle,
            size: 10,
            color: index == currentDot
                ? Theme.of(context).primaryColor
                : Theme.of(context).highlightColor,
          ),
        ),
      ),
    );
  }
}
