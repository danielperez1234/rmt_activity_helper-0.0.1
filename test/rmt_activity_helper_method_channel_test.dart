import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rmt_activity_helper/rmt_activity_helper_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelRmtActivityHelper platform = MethodChannelRmtActivityHelper();
  const MethodChannel channel = MethodChannel('rmt_activity_helper');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('remoteSendTo', () async {
    expect(await platform.remoteSendTo('12','https://play.google.com/store/apps/details?id=com.arbitrary.digalog&hl=es'), '42');
  });
}
