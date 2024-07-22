
import 'rmt_activity_helper_platform_interface.dart';

class RmtActivityHelper {
  Future<int> remoteSendTo(String deviceId, String path) {
    return RmtActivityHelperPlatform.instance.remoteSendTo(deviceId, path);
  }
}
