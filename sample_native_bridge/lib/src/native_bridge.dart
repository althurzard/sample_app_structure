import 'dart:async';
import 'package:flutter/services.dart';

class NativeBridge {
  static Future<String> getBatteryLevel(
      {String channelName = 'samples.flutter.dev/battery'}) async {
    // Get battery level.
    var platform = MethodChannel(channelName);
    var batteryLevel = 'Unknown battery level.';
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    return Future.value(batteryLevel);
  }

  static Future<String> openInputTextScreen(
      {String channelName = 'samples.flutter.dev/battery'}) async {
    // Get battery level.
    var platform = MethodChannel(channelName);
    var text = 'Unknown Text';
    try {
      final String result = await platform.invokeMethod('getInputText');
      text = result;
    } on PlatformException catch (e) {
      text = "Failed to get text: '${e.message}'.";
    }
    return Future.value(text);
  }
}
