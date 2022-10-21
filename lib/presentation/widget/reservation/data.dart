class Availability {
  Availability({required this.morning, required this.noon, required this.afternoon});
  final bool morning;
  final bool noon;
  final bool afternoon;
}

// あらかじめ何らかのキーを日付に取るマップデータを用意してそれにマッピングするだけ、本番ではここでAPIを叩くようなことはしない
List<Availability> createSampleData(DateTime day) {
  final availability = Availability(
    morning: day.day % 2 == 0,
    noon: (day.day ~/ 100000) % 4 == 0,
    afternoon: true,
  );

  return [availability];
}
