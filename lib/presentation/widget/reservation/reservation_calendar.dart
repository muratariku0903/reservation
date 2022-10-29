import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nholiday_jp/nholiday_jp.dart';
import 'package:table_calendar/table_calendar.dart';

import '../common/encircle_text.dart';
import 'data.dart';

class ReservationCalendar extends StatefulWidget {
  const ReservationCalendar({Key? key}) : super(key: key);

  @override
  State<ReservationCalendar> createState() => _ReservationCalendarState();
}

class _ReservationCalendarState extends State<ReservationCalendar> {
  DateTime _focusedDay = DateTime.now();
  List<AvailabilityItem> _selectedAvailabilityItems = [];
  AvailabilityItem? _selectedAvailabilityItem;
  Map<int, Availability> _sampleData = {};

  @override
  void initState() {
    _sampleData = createSampleData(_focusedDay);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          focusedDay: _focusedDay,
          firstDay: DateTime.utc(2010, 1, 1), // TODO: 要検討
          lastDay: DateTime.utc(2030, 1, 1), // TODO: 要検討
          locale: 'ja_JP',
          rowHeight: 70,
          daysOfWeekHeight: 50,
          headerStyle: _createHeaderStyle(), // headerはheaderTitleBuilderでカスタマイズできるかも
          eventLoader: (day) => [_sampleData[day.millisecondsSinceEpoch]!],
          calendarBuilders: CalendarBuilders(
            todayBuilder: (context, day, focusedDay) => Container(),
            outsideBuilder: (context, day, focusedDay) => Container(),
            disabledBuilder: (context, day, focusedDay) => Container(),
            defaultBuilder: (context, day, focusedDay) => Container(),
            markerBuilder: _markerBuilder,
            dowBuilder: _daysOfWeekBuilder,
          ),
          enabledDayPredicate: (day) => day.month == _focusedDay.month,
          onDaySelected: (selectedDay, focusedDay) {
            final Availability availability = _sampleData[selectedDay.millisecondsSinceEpoch]!;
            setState(() {
              _selectedAvailabilityItems = availability.values();
            });
          },
          onPageChanged: (focusedDay) {
            setState(() {
              _focusedDay = focusedDay;
              _sampleData = createSampleData(focusedDay);
              _selectedAvailabilityItems = [];
              _selectedAvailabilityItem = null;
            });
          },
        ),
        const SizedBox(height: 20),
        if (_selectedAvailabilityItems.isNotEmpty) ...[
          _createListView(_selectedAvailabilityItems),
          const SizedBox(height: 20)
        ],
        if (_selectedAvailabilityItem != null) ...[
          const SizedBox(height: 10),
          _createResult(_selectedAvailabilityItem!),
        ],
      ],
    );
  }

  HeaderStyle _createHeaderStyle() {
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

  Widget _daysOfWeekBuilder(BuildContext context, DateTime day) {
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

  Widget _markerBuilder(BuildContext context, DateTime day, List<Availability> availabilityList) {
    Availability availability = availabilityList[0];
    bool isToday = _isToday(day);
    bool isHoliday = _isHoliday(day);
    bool isAvailable = availability.isAvailable() && !isHoliday;

    CustomCalendarDayText customDayText = CustomCalendarDayText(
      dayText: day.day.toString(),
      dayTextColor: isAvailable ? Colors.black : Colors.black38,
      dayTextWeight: isToday ? FontWeight.bold : FontWeight.w700,
      encircle: isToday,
    );

    CustomCalendarMark customMark = CustomCalendarMark(
      markText: _convertLevelToMark(availability.level()),
      fontWeight: isAvailable ? FontWeight.bold : FontWeight.normal,
    );

    return CustomCalendarCell(
      dayText: customDayText,
      mark: customMark,
      bgc: isAvailable ? Colors.white : Colors.grey,
      gap: isToday ? 2 : 5,
    );
  }

  Widget _createListView(List<AvailabilityItem> availabilityItems) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: availabilityItems.length,
      itemBuilder: (context, idx) {
        return _createCard(availabilityItems[idx]);
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
              Text('空き状況 :  ${_convertLevelToMark(availabilityItem.availabilityLevel)}'),
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
      child: Column(
        children: [
          const Text(
            '選択された日時',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(text),
        ],
      ),
    );
  }

  static _isHoliday(DateTime day) {
    if (day.weekday == DateTime.sunday || day.weekday == DateTime.monday) return true;
    if (_isJapaneseHoliday(day)) return true;

    return false;
  }

  static bool _isToday(DateTime day) {
    return isSameDay(DateTime.now(), day);
  }

  static bool _isJapaneseHoliday(DateTime day) {
    try {
      return NHolidayJp.getName(day.year, day.month, day.day).isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  static _convertLevelToMark(int level) {
    switch (level) {
      case 0:
        return '×';
      case 1:
        return '△';
      case 2:
        return '○';
      default:
        return '';
    }
  }
}

class CustomCalendarCell extends StatelessWidget {
  const CustomCalendarCell({
    Key? key,
    required this.dayText,
    required this.mark,
    double? gap,
    Color? bgc,
    EdgeInsetsGeometry? padding,
  })  : gap = gap ?? 5,
        bgc = bgc ?? Colors.white,
        padding = padding ?? const EdgeInsets.all(5),
        super(key: key);

  final CustomCalendarDayText dayText;
  final CustomCalendarMark mark;
  final double gap;
  final Color bgc;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: padding,
      decoration: BoxDecoration(color: bgc),
      child: Column(
        children: [
          dayText,
          SizedBox(height: gap),
          mark,
        ],
      ),
    );
  }
}

class CustomCalendarDayText extends StatelessWidget {
  const CustomCalendarDayText({
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

    return encircle ? EncircleText(text: text) : text;
  }
}

class CustomCalendarMark extends StatelessWidget {
  const CustomCalendarMark({Key? key, required this.markText, FontWeight? fontWeight, Color? markTextColor})
      : fontWeight = fontWeight ?? FontWeight.bold,
        markTextColor = markTextColor ?? Colors.black,
        super(key: key);

  final String markText;
  final FontWeight fontWeight;
  final Color markTextColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      markText,
      style: TextStyle(
        fontWeight: fontWeight,
        color: markTextColor,
      ),
    );
  }
}
