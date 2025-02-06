import 'package:flutter/services.dart';

class FlutterDirectCall {
  static const MethodChannel _channel = MethodChannel('flutter_direct_call');

  /// Example method: Get platform version
  static Future<String?> getPlatformVersion() async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// Custom method: Make a direct phone call
  static Future<void> makeDirectCall(String phoneNumber) async {
    try {
      await _channel.invokeMethod('makeCall', {'phoneNumber': phoneNumber});
    } on PlatformException catch (e) {
      print("Error: ${e.message}");
    }
  }
}
