import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/database/database.dart';

class AccessTokenStateNotifier extends StateNotifier<String> {
  final Ref ref;
  AccessTokenStateNotifier(this.ref) : super("");

  void setAccessToken(String accessToken) {
    DatabaseSingleton db = ref.watch(databaseProvider);
    db.saveToken(accessToken);
  }
}

final accessTokenStateNotifierProvider =
    StateNotifierProvider<AccessTokenStateNotifier, String>((ref) {
  return AccessTokenStateNotifier(ref);
});

final accessTokenProvider = Provider<Future<String>>((ref) {
  DatabaseSingleton db = ref.watch(databaseProvider);
  return db.getToken();
});
