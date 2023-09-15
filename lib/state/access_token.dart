import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccessTokenStateNotifier extends StateNotifier<String> {
  AccessTokenStateNotifier() : super("");

  void setAccessToken(String accessToken) {
    state = accessToken;
  }
}

final accessTokenProvider =
    StateNotifierProvider<AccessTokenStateNotifier, String>(
  (ref) => AccessTokenStateNotifier(),
);
