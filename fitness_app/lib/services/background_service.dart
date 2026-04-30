import 'dart:async';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:pedometer/pedometer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackgroundService {

  static Future<void> initialize() async {
    final service = FlutterBackgroundService();

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        isForegroundMode: true,
        autoStart: true,
        notificationChannelId: 'fitness_channel',
        initialNotificationTitle: 'Fitness Tracker',
        initialNotificationContent: 'Tracking steps...',
      ),
      iosConfiguration: IosConfiguration(),
    );

    service.startService();
  }
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {

  int lastSteps = 0;

  Future<String> todayKey() async {
    final now = DateTime.now();
    return "${now.year}-${now.month}-${now.day}";
  }

  Future<void> saveSteps(int steps) async {
    final prefs = await SharedPreferences.getInstance();
    final key = await todayKey();
    await prefs.setInt(key, steps);
  }

  Pedometer.stepCountStream.listen((event) async {
    int steps = event.steps;

    await saveSteps(steps);

    service.invoke("update", {
      "steps": steps,
    });
  });
}