import 'package:flutter/material.dart';

Color bronze = const Color.fromRGBO(205, 127, 50, 1);
Color silver = const Color.fromRGBO(192, 192, 192, 1);
Color gold = const Color.fromRGBO(255, 215, 0, 1);

Color colorFromAchievementLevel(String level) {
  switch (level) {
    case "bronze":
      return bronze;
    case "silver":
      return silver;
    case "gold":
      return gold;
    default:
      throw Exception("Invalid achievement level");
  }
}
