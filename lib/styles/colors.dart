import 'package:flutter/material.dart';
import 'package:logic_app/models/award.dart';

Color bronze = const Color.fromRGBO(205, 127, 50, 1);
Color silver = const Color.fromRGBO(192, 192, 192, 1);
Color gold = const Color.fromRGBO(255, 215, 0, 1);

Color colorFromAwardLevel(AwardLevel level) {
  switch (level) {
    case AwardLevel.bronze:
      return bronze;
    case AwardLevel.silver:
      return silver;
    case AwardLevel.gold:
      return gold;
  }
}
