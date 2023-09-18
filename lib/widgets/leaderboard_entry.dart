import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/leaderboard_entry.dart';
import 'package:logic_app/styles/text.dart';
import 'package:logic_app/widgets/star_progress_indicator.dart';

class LeaderboardHeaderWidget extends ConsumerWidget {
  const LeaderboardHeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 30, child: Icon(Icons.bar_chart)),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            "Player",
            textAlign: TextAlign.left,
            style: tableHeadlineTextStyle(context),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 120,
          child: Text(
            "Experience",
            textAlign: TextAlign.center,
            style: tableHeadlineTextStyle(context),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 30,
          child: Text(
            "#",
            textAlign: TextAlign.right,
            style: tableHeadlineTextStyle(context),
          ),
        ),
      ],
    );
  }
}

class LeaderboardEntryWidget extends ConsumerWidget {
  final LeaderboardEntry player;
  final int rank;

  const LeaderboardEntryWidget(
      {super.key, required this.player, required this.rank});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 30,
          child: Text(
            rank.toString(),
            textAlign: TextAlign.right,
            style: tableContentTextStyle(context),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            player.username,
            textAlign: TextAlign.left,
            style: tableContentTextStyle(context),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 120,
          child: StarProgressIndicator(value: player.experience),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 30,
          child: Text(
            player.points.toString(),
            textAlign: TextAlign.right,
            style: tableContentTextStyle(context),
          ),
        ),
      ],
    );
  }
}
