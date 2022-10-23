import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'data.dart';

class ReservationCalendar extends StatefulWidget {
  const ReservationCalendar({Key? key}) : super(key: key);

  @override
  State<ReservationCalendar> createState() => _ReservationCalendarState();
}

class _ReservationCalendarState extends State<ReservationCalendar> {
  final AvailabilityFactory availabilityFactory = AvailabilityFactory();
  DateTime _focusedDay = DateTime.now();
  List<AvailabilityItem> _selectedAvailabilityItems = [];
  AvailabilityItem? _selectedAvailabilityItem;
  Map<int, Availability> _sampleData = {};

  @override
  void initState() {
    _sampleData = _createSampleData(_focusedDay);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _selectedAvailabilityItems.isNotEmpty ? MediaQuery.of(context).size.height : null,
      color: Colors.white,
      child: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2010, 1, 1), // TODO: 要検討
            lastDay: DateTime.utc(2030, 1, 1), // TODO: 要検討
            locale: 'ja_JP',
            rowHeight: 70,
            daysOfWeekHeight: 50,
            headerStyle: CustomCalendarStyle.header(), // headerはheaderTitleBuilderでカスタマイズできるかも
            eventLoader: (day) => [_sampleData[day.millisecondsSinceEpoch]!],
            calendarBuilders: const CalendarBuilders(
              todayBuilder: CustomCalendarBuilders.todayBuilder,
              outsideBuilder: CustomCalendarBuilders.outsideBuilder,
              disabledBuilder: CustomCalendarBuilders.disabledBuilder,
              defaultBuilder: CustomCalendarBuilders.defaultBuilder,
              markerBuilder: CustomCalendarBuilders.markerBuilder,
              dowBuilder: CustomCalendarBuilders.daysOfWeekBuilder,
            ),
            enabledDayPredicate: (day) => day.month == _focusedDay.month,
            onDaySelected: (selectedDay, focusedDay) {
              final Availability availability = _sampleData[selectedDay.millisecondsSinceEpoch]!;
              setState(() {
                _selectedAvailabilityItems = [availability.morning, availability.noon, availability.afternoon];
              });
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
                _sampleData = _createSampleData(focusedDay);
                _selectedAvailabilityItems = [];
                _selectedAvailabilityItem = null;
              });
            },
          ),
          const SizedBox(height: 20),
          if (_selectedAvailabilityItems.isNotEmpty) ...[
            Expanded(child: _createListView(_selectedAvailabilityItems)),
            const SizedBox(height: 20)
          ],
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              '選択された日時',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (_selectedAvailabilityItem != null) ...[
            const SizedBox(height: 10),
            _createResult(_selectedAvailabilityItem!),
          ],
        ],
      ),
    );
  }

  Map<int, Availability> _createSampleData(DateTime date) {
    int msPerHour = 1000 * 60 * 60;
    int msPerDay = msPerHour * 24;
    int year = date.year;
    int month = date.month;
    int start = DateTime(year, month, 1).millisecondsSinceEpoch + msPerHour * 9;
    int end = DateTime(year, month + 1, 0).millisecondsSinceEpoch + msPerHour * 9;
    Map<int, Availability> data = {};
    for (var ms = start; ms <= end; ms += msPerDay) {
      data[ms] = availabilityFactory.create(ms);
    }

    return data;
  }

  Widget _createListView(List<AvailabilityItem> availabilityItems) {
    return ListView.builder(
      itemCount: availabilityItems.length,
      itemBuilder: (context, idx) {
        AvailabilityItem availabilityItem = availabilityItems[idx];

        return _createCard(availabilityItem);
      },
    );
  }

  Widget _createCard(AvailabilityItem availabilityItem) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAvailabilityItem = availabilityItem;
        });
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${availabilityItem.startHour()}:00~${availabilityItem.endHour()}:00'),
              Text('空き状況 :  ${availabilityItem.mark()}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createResult(AvailabilityItem availabilityItem) {
    int year = availabilityItem.year();
    int month = availabilityItem.month();
    int day = availabilityItem.day();
    int startH = availabilityItem.startHour();
    int endH = availabilityItem.endHour();
    String text = '$year年 $month月 $day日 $startH:00~$endH:00';

    return Container(
      alignment: Alignment.centerLeft,
      child: Text(text),
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

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        availability.mark(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
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
