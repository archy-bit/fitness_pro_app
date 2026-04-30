import 'package:flutter/material.dart';
import 'app.dart';
import 'services/background_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // запуск фонового сервісу (крокомір)
  await BackgroundService.initialize();

  runApp(FitnessApp());
}