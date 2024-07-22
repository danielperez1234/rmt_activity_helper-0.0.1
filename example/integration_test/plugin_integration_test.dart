// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction


import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:rmt_activity_helper/rmt_activity_helper.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('remoteSendTo test', (WidgetTester tester) async {
    final RmtActivityHelper plugin = RmtActivityHelper();
    final int version = await plugin.remoteSendTo('asd','https://play.google.com/store/apps/details?id=com.arbitrary.digalog&hl=es');
    // The version string depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(version, true);
  });
}
