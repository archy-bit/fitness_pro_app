import 'package:flutter/material.dart';
import 'dashboard.dart';

class AuthScreen extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Fitness Pro", style: TextStyle(fontSize: 28)),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(hintText: "Email"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Dashboard()),
                );
              },
              child: Text("Увійти"),
            )
          ],
        ),
      ),
    );
  }
}