import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/leaderboard_entry.dart';

final leaderboardEntriesProvider = FutureProvider<List<LeaderboardEntry>>(
  (ref) {
    var response = http.get(Uri.parse("https://localhost:443/players"));
    return response.then((data) {
      var json = jsonDecode(data.body);
      List<LeaderboardEntry> leaderboard = List.empty(growable: true);
      json.forEach((entry) {
        leaderboard.add(LeaderboardEntry.fromJson(entry));
      });
      return leaderboard;
    });
  },
);
