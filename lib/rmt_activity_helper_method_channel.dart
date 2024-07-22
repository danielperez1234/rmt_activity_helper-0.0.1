import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'rmt_activity_helper_platform_interface.dart';

/// An implementation of [RmtActivityHelperPlatform] that uses method channels.
class MethodChannelRmtActivityHelper extends RmtActivityHelperPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('rmt_activity_helper');

  @override
  Future<int> remoteSendTo(String deviceId, String path) async {
    final success = await methodChannel.invokeMethod<int>('remoteSendTo',{

      "deviceId": deviceId,
      "path":path

    });
    return (success) ?? 0;
  }
}
