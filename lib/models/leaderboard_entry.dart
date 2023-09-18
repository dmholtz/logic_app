import "package:freezed_annotation/freezed_annotation.dart";

part 'leaderboard_entry.freezed.dart';
part 'leaderboard_entry.g.dart';

@freezed
class LeaderboardEntry with _$LeaderboardEntry {
  const factory LeaderboardEntry(
      {required String username,
      required double experience,
      required int points}) = _LeaderboardEntry;

  factory LeaderboardEntry.fromJson(Map<String, Object?> json) =>
      _$LeaderboardEntryFromJson(json);
}
