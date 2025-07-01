import 'package:flutter/services.dart';

class MethodChannelServices {
  static const MethodChannel _channelName = MethodChannel('channel-name'); // method-channel name

  Future<String> getBatteryLevel() async {
    try {
      final result = await _channelName.invokeListMethod('getBatteryLevel'); // invokemethod call native method
      return 'Battery Level: $result';
    } catch (e) {
      return 'Failed to Get Battery Percentage $e';
    }
  }
}