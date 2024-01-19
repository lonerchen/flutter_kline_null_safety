import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_kline_platform_interface.dart';

/// An implementation of [FlutterKlinePlatform] that uses method channels.
class MethodChannelFlutterKline extends FlutterKlinePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_kline');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
