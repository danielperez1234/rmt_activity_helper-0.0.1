import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'rmt_activity_helper_method_channel.dart';

abstract class RmtActivityHelperPlatform extends PlatformInterface {
  /// Constructs a RmtActivityHelperPlatform.
  RmtActivityHelperPlatform() : super(token: _token);

  static final Object _token = Object();

  static RmtActivityHelperPlatform _instance = MethodChannelRmtActivityHelper();

  /// The default instance of [RmtActivityHelperPlatform] to use.
  ///
  /// Defaults to [MethodChannelRmtActivityHelper].
  static RmtActivityHelperPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RmtActivityHelperPlatform] when
  /// they register themselves.
  static set instance(RmtActivityHelperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int> remoteSendTo(String deviceId, String path) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
