import 'package:pedometer/pedometer.dart';

class StepService {
  static void init(Function(int) onUpdate) {
    Pedometer.stepCountStream.listen((event) {
      onUpdate(event.steps);
    });
  }
}