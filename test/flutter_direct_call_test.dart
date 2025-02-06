import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_direct_call/flutter_direct_call.dart';
import 'package:flutter_direct_call/flutter_direct_call_platform_interface.dart';
import 'package:flutter_direct_call/flutter_direct_call_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterDirectCallPlatform
    with MockPlatformInterfaceMixin
    implements FlutterDirectCallPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterDirectCallPlatform initialPlatform = FlutterDirectCallPlatform.instance;

  test('$MethodChannelFlutterDirectCall is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterDirectCall>());
  });

  test('getPlatformVersion', () async {
    FlutterDirectCall flutterDirectCallPlugin = FlutterDirectCall();
    MockFlutterDirectCallPlatform fakePlatform = MockFlutterDirectCallPlatform();
    FlutterDirectCallPlatform.instance = fakePlatform;

    expect(await flutterDirectCallPlugin.getPlatformVersion(), '42');
  });
}
