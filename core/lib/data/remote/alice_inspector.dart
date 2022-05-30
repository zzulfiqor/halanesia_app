import 'package:alice/alice.dart';

class AliceInspector {
  final alice = createAlice();

  AliceInspector._internal();

  static final _singleton = AliceInspector._internal();

  factory AliceInspector() => _singleton;

  static Alice createAlice() {
    var alice = Alice(
      showNotification: true,
      showInspectorOnShake: true,
      darkTheme: false,
      maxCallsCount: 1000,
    );
    return alice;
  }
}
