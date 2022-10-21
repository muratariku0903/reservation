import 'dart:math';

class Availability {
  Availability({required this.morning, required this.noon, required this.afternoon});
  final bool morning;
  final bool noon;
  final bool afternoon;
}

// あらかじめ何らかのキーを日付に取るマップデータを用意してそれにマッピングするだけ、本番ではここでAPIを叩くようなことはしない
List<Availability> createSampleData(DateTime day) {
  final availability = Availability(
    morning: Random().nextInt(2) == 1,
    noon: Random().nextInt(2) == 1,
    afternoon: Random().nextInt(2) == 1,
  );

  return [availability];
}
