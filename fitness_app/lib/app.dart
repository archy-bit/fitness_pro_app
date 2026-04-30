import 'package:flutter/material.dart';
import 'screens/dashboard.dart';
import 'screens/goals.dart';
import 'screens/workouts.dart';
import 'screens/auth.dart';

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: AuthScreen(),
    );
  }
}