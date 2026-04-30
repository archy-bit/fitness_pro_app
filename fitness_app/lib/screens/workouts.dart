import 'package:flutter/material.dart';

class WorkoutsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Тренування")),
      body: ListView(
        children: [
          ListTile(title: Text("Віджимання")),
          ListTile(title: Text("Присідання")),
          ListTile(title: Text("Біг")),
        ],
      ),
    );
  }
}