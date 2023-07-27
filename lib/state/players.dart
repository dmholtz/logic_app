import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/player.dart';

final playersProvider = StateProvider<List<Player>>((ref) => [
      Player(name: "Player 1", rank: 1, starsPercentage: 0.8, points: 100),
      Player(name: "Player 2", rank: 2, starsPercentage: 0.7, points: 90),
      Player(name: "xzy", rank: 3, starsPercentage: 0.6, points: 80),
      Player(
          name: "PlayerIHaveReallyLongName",
          rank: 4,
          starsPercentage: 0.6,
          points: 80),
      Player(name: "Player 3", rank: 5, starsPercentage: 0.6, points: 80),
      Player(name: "Player 3", rank: 6, starsPercentage: 0.6, points: 80),
      Player(name: "Player 3", rank: 7, starsPercentage: 0.2, points: 80),
      Player(name: "Player 3", rank: 8, starsPercentage: 0.3, points: 80),
      Player(name: "Player 3", rank: 9, starsPercentage: 0.6, points: 80),
      Player(name: "Player 3", rank: 10, starsPercentage: 0.6, points: 80),
      Player(name: "Player 3", rank: 11, starsPercentage: 1.0, points: 32),
      Player(name: "Player 3", rank: 12, starsPercentage: 0.6, points: 22),
      Player(name: "Player 3", rank: 13, starsPercentage: 0.6, points: 2),
    ]);
