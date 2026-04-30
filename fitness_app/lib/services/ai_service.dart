class AIService {
  static String analyze(int steps, int goal) {
    double p = steps / goal;

    if (p < 0.4) return "⚠️ Низька активність";
    if (p < 0.8) return "💪 Нормально";
    return "🔥 Відмінно!";
  }
}