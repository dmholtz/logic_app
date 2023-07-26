enum AwardLevel {
  bronze,
  silver,
  gold,
}

class Award {
  final String name;
  final String description;
  final AwardLevel level;
  final bool isAchieved;

  Award({
    required this.name,
    required this.description,
    required this.level,
    required this.isAchieved,
  });
}
