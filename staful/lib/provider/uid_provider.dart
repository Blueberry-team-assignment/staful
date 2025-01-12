import 'package:flutter_riverpod/flutter_riverpod.dart';

final uidProvider = StateNotifierProvider<UidNotifier, String?>((ref) {
  return UidNotifier();
});

class UidNotifier extends StateNotifier<String?> {
  UidNotifier() : super(null);
 
  void setUid(String? uid) {
    state = uid;
  }

  void resetUid() {
    state = null;
  }
}
