import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/award.dart';

final awardsProvider = StateProvider<List<Award>>((ref) {
  return [
    Award(
      name: "First Steps",
      description: "Complete the first level",
      level: AwardLevel.bronze,
      isAchieved: true,
    ),
    Award(
      name: "First Steps",
      description: "Complete the first level",
      level: AwardLevel.bronze,
      isAchieved: true,
    ),
    Award(
      name: "First Steps",
      description: "Complete the first level",
      level: AwardLevel.bronze,
      isAchieved: true,
    ),
    Award(
      name: "First Steps",
      description: "Complete the first level",
      level: AwardLevel.silver,
      isAchieved: true,
    ),
    Award(
      name: "First Steps",
      description: "Complete the first level",
      level: AwardLevel.bronze,
      isAchieved: false,
    ),
    Award(
      name: "First Steps",
      description: "Complete the first level",
      level: AwardLevel.gold,
      isAchieved: true,
    ),
    Award(
      name: "First Steps",
      description: "Complete the first level",
      level: AwardLevel.bronze,
      isAchieved: true,
    ),
    Award(
      name: "First Steps",
      description: "Complete the first level",
      level: AwardLevel.bronze,
      isAchieved: true,
    ),
  ];
});
