import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutterkline_method_channel.dart';

abstract class FlutterklinePlatform extends PlatformInterface {
  /// Constructs a FlutterklinePlatform.
  FlutterklinePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterklinePlatform _instance = MethodChannelFlutterkline();

  /// The default instance of [FlutterklinePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterkline].
  static FlutterklinePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterklinePlatform] when
  /// they register themselves.
  static set instance(FlutterklinePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
