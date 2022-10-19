import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/localizations.dart';

class ReservationCalendar extends StatefulWidget {
  const ReservationCalendar({Key? key}) : super(key: key);

  @override
  State<ReservationCalendar> createState() => _ReservationCalendarState();
}

class _ReservationCalendarState extends State<ReservationCalendar> {
  // DateTime firstDateOfWeekTS;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey,
      child: Column(
        children: [
          SfCalendar(
            view: CalendarView.week,
            headerStyle: const CalendarHeaderStyle(
              textAlign: TextAlign.center,
              backgroundColor: Colors.green,
              textStyle: TextStyle(backgroundColor: Colors.red),
            ),
            // todayHighlightColor: Colors.white,
            todayTextStyle: const TextStyle(
              color: Colors.red,
              // backgroundColor: Colors.white,
            ),
            backgroundColor: Colors.grey[200],
            headerDateFormat: 'ありがとう',
          ),
        ],
      ),
    );
  }

  Widget createCalendarHeader() {
    // 月や年が変わったりするのにも対応してないと。
    // 月がまたがる場合もあるからな。どのように表示するのがベストだろうか
    return Container();
  }

  Widget createCalendarBody() {
    return Container();
  }

  // DateTime getFirstDateOfWeek(int ts) {

  // }
}
