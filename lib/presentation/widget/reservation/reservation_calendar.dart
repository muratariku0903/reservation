import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reservation/presentation/widget/reservation/data.dart';
import 'package:table_calendar/table_calendar.dart';

class ReservationCalendar extends StatefulWidget {
  const ReservationCalendar({Key? key}) : super(key: key);

  @override
  State<ReservationCalendar> createState() => _ReservationCalendarState();
}

class _ReservationCalendarState extends State<ReservationCalendar> {
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    print('build');

    return Column(
      children: [
        TableCalendar(
          // 最終的にこれもクラス化したいな
          focusedDay: focusedDay,
          firstDay: DateTime.utc(2010, 1, 1),
          lastDay: DateTime.utc(2030, 1, 1),
          locale: 'ja_JP',
          rowHeight: 70,
          daysOfWeekHeight: 50,
          headerStyle: CustomCalendarStyle.header(),
          eventLoader: createSampleData, // headerはheaderTitleBuilderでカスタマイズできるかも
          calendarBuilders: const CalendarBuilders(
            todayBuilder: CustomCalendarBuilders.todayBuilder,
            outsideBuilder: CustomCalendarBuilders.outsideBuilder,
            disabledBuilder: CustomCalendarBuilders.disabledBuilder,
            defaultBuilder: CustomCalendarBuilders.defaultBuilder,
            markerBuilder: CustomCalendarBuilders.markerBuilder,
            dowBuilder: CustomCalendarBuilders.daysOfWeekBuilder,
          ),
          enabledDayPredicate: (day) => day.month == focusedDay.month,
        )
      ],
    );
  }
}

class CustomCalendarStyle {
  static HeaderStyle header() {
    Color textColor = Colors.white;

    return HeaderStyle(
      titleCentered: true,
      formatButtonVisible: false,
      headerPadding: const EdgeInsets.all(0),
      titleTextStyle: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
      leftChevronIcon: Icon(Icons.chevron_left, color: textColor),
      rightChevronIcon: Icon(Icons.chevron_right, color: textColor),
    );
  }
}

class CustomCalendarBuilders {
  static Widget todayBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
    return CustomCalendarCell(
      dayText: day.day.toString(),
      dayTextWeight: FontWeight.bold,
      padding: const EdgeInsets.all(5),
      encircle: true,
    );
  }

  static Widget defaultBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
    return CustomCalendarCell(dayText: day.day.toString());
  }

  static Widget outsideBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
    return Container();
  }

  static Widget disabledBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
    return Container();
  }

  static Widget markerBuilder(BuildContext context, DateTime day, List<Availability> availabilityList) {
    Availability availability = availabilityList[0];
    int cnt = 0;
    if (availability.morning) cnt++;
    if (availability.noon) cnt++;
    if (availability.afternoon) cnt++;
    print([availability.morning, availability.noon, availability.afternoon]);

    String mark = '';
    if (cnt == 3) mark = '○';
    if (cnt == 1 || cnt == 2) mark = '△';
    if (cnt == 0) mark = '×';

    return Text(mark);
  }

  static Widget daysOfWeekBuilder(BuildContext context, DateTime day) {
    final languageCode = Localizations.localeOf(context).languageCode;
    final text =
        const DaysOfWeekStyle().dowTextFormatter?.call(day, languageCode) ?? DateFormat.E(languageCode).format(day);

    return Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CustomCalendarCell extends StatelessWidget {
  const CustomCalendarCell({
    Key? key,
    required this.dayText,
    Color? dayTextColor,
    FontWeight? dayTextWeight,
    EdgeInsetsGeometry? padding,
    bool? encircle,
  })  : dayTextColor = dayTextColor ?? Colors.black,
        dayTextWeight = dayTextWeight ?? FontWeight.normal,
        padding = padding ?? const EdgeInsets.all(8.0),
        encircle = encircle ?? false,
        super(key: key);

  final String dayText;
  final Color dayTextColor;
  final FontWeight dayTextWeight;
  final EdgeInsetsGeometry padding;
  final bool encircle;

  @override
  Widget build(BuildContext context) {
    Text text = Text(
      dayText,
      style: TextStyle(
        color: dayTextColor,
        fontWeight: dayTextWeight,
      ),
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: padding,
      decoration: BoxDecoration(border: Border.all()),
      alignment: Alignment.topCenter,
      child: encircle ? Encircle(text: text) : text,
    );
  }
}

class Encircle extends StatelessWidget {
  const Encircle({
    Key? key,
    required this.text,
    Color? bgc,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    BoxShape? shape,
  })  : width = width ?? 25,
        height = height ?? 25,
        margin = margin ?? EdgeInsets.zero,
        padding = padding ?? const EdgeInsets.all(0),
        shape = shape ?? BoxShape.circle,
        bgc = bgc ?? Colors.red,
        super(key: key);

  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final BoxShape shape;
  final Color bgc;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgc,
        shape: shape,
      ),
      child: text,
    );
  }
}
