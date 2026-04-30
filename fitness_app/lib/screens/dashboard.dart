import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import '../services/ai_service.dart';

class Dashboard extends StatefulWidget {
  @override
  State createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int steps = 0;
  int goal = 10000;

  @override
  void initState() {
    super.initState();

    final service = FlutterBackgroundService();

    service.on('update').listen((event) {
      setState(() {
        steps = event?["steps"] ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    double progress = steps / goal;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Fitness Pro")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            Text("Сьогодні", style: TextStyle(color: Colors.grey)),

            SizedBox(height: 10),

            Text(
              "$steps",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            LinearProgressIndicator(value: progress),

            SizedBox(height: 20),

            Text(
              AIService.analyze(steps, goal),
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}