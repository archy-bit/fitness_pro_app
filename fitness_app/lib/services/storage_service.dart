import 'package:shared_preferences/shared_preferences.dart';

class StorageService {

  static String todayKey() {
    final now = DateTime.now();
    return "${now.year}-${now.month}-${now.day}";
  }

  static Future saveSteps(int steps) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(todayKey(), steps);
  }

  static Future<int> getTodaySteps() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(todayKey()) ?? 0;
  }
}