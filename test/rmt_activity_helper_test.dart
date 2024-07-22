import 'package:flutter_test/flutter_test.dart';
import 'package:rmt_activity_helper/rmt_activity_helper.dart';
import 'package:rmt_activity_helper/rmt_activity_helper_platform_interface.dart';
import 'package:rmt_activity_helper/rmt_activity_helper_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockRmtActivityHelperPlatform
    with MockPlatformInterfaceMixin
    implements RmtActivityHelperPlatform {

  @override
  Future<int> remoteSendTo(String s, String path) => Future.value(42);
}

void main() {
  final RmtActivityHelperPlatform initialPlatform = RmtActivityHelperPlatform.instance;

  test('$MethodChannelRmtActivityHelper is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelRmtActivityHelper>());
  });

  test('remoteSendTo', () async {
    RmtActivityHelper rmtActivityHelperPlugin = RmtActivityHelper();
    MockRmtActivityHelperPlatform fakePlatform = MockRmtActivityHelperPlatform();
    RmtActivityHelperPlatform.instance = fakePlatform;

    expect(await rmtActivityHelperPlugin.remoteSendTo('123','https://play.google.com/store/apps/details?id=com.arbitrary.digalog&hl=es'), '42');
  });
}
