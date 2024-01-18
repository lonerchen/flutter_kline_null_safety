import 'package:flutter_test/flutter_test.dart';
import 'package:flutterkline/flutterkline.dart';
import 'package:flutterkline/flutterkline_platform_interface.dart';
import 'package:flutterkline/flutterkline_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterklinePlatform
    with MockPlatformInterfaceMixin
    implements FlutterklinePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterklinePlatform initialPlatform = FlutterklinePlatform.instance;

  test('$MethodChannelFlutterkline is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterkline>());
  });

  test('getPlatformVersion', () async {
    Flutterkline flutterklinePlugin = Flutterkline();
    MockFlutterklinePlatform fakePlatform = MockFlutterklinePlatform();
    FlutterklinePlatform.instance = fakePlatform;

    expect(await flutterklinePlugin.getPlatformVersion(), '42');
  });
}
