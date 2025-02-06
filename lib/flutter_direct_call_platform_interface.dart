import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_direct_call_method_channel.dart';

abstract class FlutterDirectCallPlatform extends PlatformInterface {
  /// Constructs a FlutterDirectCallPlatform.
  FlutterDirectCallPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterDirectCallPlatform _instance = MethodChannelFlutterDirectCall();

  /// The default instance of [FlutterDirectCallPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterDirectCall].
  static FlutterDirectCallPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterDirectCallPlatform] when
  /// they register themselves.
  static set instance(FlutterDirectCallPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
