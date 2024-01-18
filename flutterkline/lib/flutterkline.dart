
import 'flutterkline_platform_interface.dart';

class Flutterkline {
  Future<String?> getPlatformVersion() {
    return FlutterklinePlatform.instance.getPlatformVersion();
  }
}
