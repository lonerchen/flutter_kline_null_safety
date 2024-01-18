import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutterkline_platform_interface.dart';

/// An implementation of [FlutterklinePlatform] that uses method channels.
class MethodChannelFlutterkline extends FlutterklinePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutterkline');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
