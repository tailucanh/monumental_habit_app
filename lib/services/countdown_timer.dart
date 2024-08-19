import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimer {
  Timer? _timer;
  Duration _remainingTime;
  VoidCallback? onTick;

  CountdownTimer({this.onTick}) : _remainingTime = _calculateRemainingTime();

  static Duration _calculateRemainingTime() {
    DateTime now = DateTime.now();
    DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);
    return endOfDay.difference(now);
  }

  void start(VoidCallback onReset) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds <= 0) {
        _remainingTime = _calculateRemainingTime();
        onReset();
        start(onReset);
      } else {
        _remainingTime -= const Duration(seconds: 1);
        if (onTick != null) onTick!();
      }
    });
  }

  void stop() {
    _timer?.cancel();
  }

  String getTimeHours() {
    return  _remainingTime.inHours.toString().padLeft(2, '0');
  }
  String getTimeMinutes() {
    return (_remainingTime.inMinutes % 60).toString().padLeft(2, '0');
  }
  String getTimeSeconds() {
    return (_remainingTime.inSeconds % 60).toString().padLeft(2, '0');
  }
}
