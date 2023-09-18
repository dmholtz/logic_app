import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:logic_app/models/achievement.dart';
import 'package:logic_app/state/access_token.dart';

final achievementsProvider = FutureProvider<List<Achievement>>(
  (ref) {
    return ref.watch(bearerAccessTokenProvider).then((token) {
      var response = http.get(
        Uri.parse("https://localhost:443/players/player/achievements"),
        headers: {"Authorization": token},
      );
      return response.then((data) {
        var json = jsonDecode(data.body);
        List<Achievement> achievements = List.empty(growable: true);
        json.forEach((entry) {
          achievements.add(Achievement.fromJson(entry));
        });
        return achievements;
      });
    });
  },
);
