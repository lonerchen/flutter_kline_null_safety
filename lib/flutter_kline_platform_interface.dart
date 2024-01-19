import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_kline_method_channel.dart';

abstract class FlutterKlinePlatform extends PlatformInterface {
  /// Constructs a FlutterKlinePlatform.
  FlutterKlinePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterKlinePlatform _instance = MethodChannelFlutterKline();

  /// The default instance of [FlutterKlinePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterKline].
  static FlutterKlinePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterKlinePlatform] when
  /// they register themselves.
  static set instance(FlutterKlinePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
