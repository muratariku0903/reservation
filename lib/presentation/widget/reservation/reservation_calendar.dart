import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:nholiday_jp/nholiday_jp.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../domain/acceptable/model/acceptable.dart';
import '../../../domain/acceptable/model/holiday.dart' as HolidayModel;
import '../../../domain/acceptable/model/time_acceptable.dart';
import '../common/encircle_text.dart';
import 'data.dart';

class ReservationCalendar extends StatefulWidget {
  const ReservationCalendar({
    Key? key,
    required this.fetchDataCallback,
    required this.cardTapCallback,
    required this.scrollController,
  }) : super(key: key);
  final Future<Acceptable> Function(int officeCode, DateTime day) fetchDataCallback;
  final Function cardTapCallback;
  final ScrollController scrollController;

  @override
  State<ReservationCalendar> createState() => ReservationCalendarState();
}

class ReservationCalendarState extends State<ReservationCalendar> {
  DateTime _focusedDay = DateTime.now();
  List<AvailabilityItem> _selectedAvailabilityItems = [];
  AvailabilityItem? _selectedAvailabilityItem;
  Map<int, Availability> _sampleData = {};
  Map<int, HolidayModel.Holiday> _holidays = {};

  AvailabilityItem? value() {
    return _selectedAvailabilityItem;
  }

  @override
  void initState() {
    setData();
    super.initState();
  }

  void setData() async {
    Acceptable acceptable = await widget.fetchDataCallback(1, getNextBusinessDay(DateTime.now()));
    setState(() {
      _sampleData = convertTimeAcceptableList(acceptable.timeAcceptableList);
      _holidays = acceptable.holidayList;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_sampleData);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_sampleData.isNotEmpty)
          TableCalendar(
            availableGestures: AvailableGestures.horizontalSwipe,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2010, 1, 1),
            lastDay: DateTime.utc(2030, 1, 1),
            locale: 'ja_JP',
            rowHeight: 70,
            daysOfWeekHeight: 50,
            headerStyle: createHeaderStyle(),
            eventLoader: (day) {
              print(day.subtract(const Duration(hours: 9)).millisecondsSinceEpoch);
              return [_sampleData[day.subtract(const Duration(hours: 9)).millisecondsSinceEpoch]!];
            },
            calendarBuilders: CalendarBuilders(
              todayBuilder: (context, day, focusedDay) => Container(),
              outsideBuilder: (context, day, focusedDay) => Container(),
              disabledBuilder: (context, day, focusedDay) => Container(),
              defaultBuilder: (context, day, focusedDay) => Container(),
              markerBuilder: markerBuilder,
              dowBuilder: daysOfWeekBuilder,
            ),
            // enabledDayPredicate: (day) => day.month == _focusedDay.month,
            onDaySelected: (selectedDay, focusedDay) {
              final Availability availability =
                  _sampleData[selectedDay.subtract(const Duration(hours: 9)).millisecondsSinceEpoch]!;
              bool isAvailableDay = _isBusinessDay(selectedDay) && availability.isAvailable();
              if (isAvailableDay) {
                setState(() {
                  _selectedAvailabilityItems = availability.items;
                });
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  widget.scrollController.animateTo(
                    widget.scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                });
              }
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
                // _sampleData = createSampleData(focusedDay);
                _selectedAvailabilityItems = [];
                _selectedAvailabilityItem = null;
              });
            },
          ),
        const SizedBox(height: 20),
        if (_selectedAvailabilityItems.isNotEmpty) ...[
          createListView(_selectedAvailabilityItems),
          const SizedBox(height: 20)
        ],
        if (_selectedAvailabilityItem != null) ...[
          const SizedBox(height: 10),
          createResult(_selectedAvailabilityItem!),
        ],
      ],
    );
  }

  HeaderStyle createHeaderStyle() {
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

  Widget daysOfWeekBuilder(BuildContext context, DateTime day) {
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

  Widget markerBuilder(BuildContext context, DateTime day, List<Availability> availabilityList) {
    Availability availability = availabilityList[0];
    bool isAvailableDay = _isBusinessDay(day) && availability.isAvailable();
    bool isToday = isSameDay(day, DateTime.now());

    CustomCalendarDayText customDayText = CustomCalendarDayText(
      dayText: day.day.toString(),
      dayTextColor: isAvailableDay ? Colors.black : Colors.black38,
      dayTextWeight: isToday ? FontWeight.bold : FontWeight.w700,
      encircle: isToday,
    );

    CustomCalendarMark customMark = CustomCalendarMark(
      markText: _isBusinessDay(day) ? convertLevelToMark(availability.level()) : '-',
      fontWeight: isAvailableDay ? FontWeight.bold : FontWeight.normal,
    );

    return CustomCalendarCell(
      dayText: customDayText,
      mark: customMark,
      bgc: isAvailableDay ? Colors.white : Colors.grey,
      gap: isToday ? 2 : 5,
    );
  }

  Widget createListView(List<AvailabilityItem> availabilityItems) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: availabilityItems.length,
      itemBuilder: (context, idx) {
        return createCard(availabilityItems[idx]);
      },
    );
  }

  Widget createCard(AvailabilityItem availabilityItem) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAvailabilityItem = availabilityItem;
        });
        widget.cardTapCallback();
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${availabilityItem.startHour()}:00~${availabilityItem.endHour()}:00'),
              Text('Acceptable :  ${convertLevelToMark(availabilityItem.availabilityLevel)}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget createResult(AvailabilityItem availabilityItem) {
    int year = availabilityItem.year();
    int month = availabilityItem.month();
    int day = availabilityItem.day();
    int startH = availabilityItem.startHour();
    int endH = availabilityItem.endHour();
    String text = '$year??? $month??? $day??? $startH:00~$endH:00';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'selected date',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text),
      ],
    );
  }

  static DateTime getNextBusinessDay(DateTime from) {
    DateTime day = from.add(const Duration(days: 1));

    return isHoliday(day) ? getNextBusinessDay(day) : day;
  }

  static bool _isBusinessDay(DateTime day) {
    if (isHoliday(day)) return false;
    if (!isValidRangeDay(day)) return false;

    return true;
  }

  static bool isHoliday(DateTime day) {
    if (day.weekday == DateTime.sunday || day.weekday == DateTime.monday) return true;
    if (isJapaneseHoliday(day)) return true;

    return false;
  }

  static bool isValidRangeDay(DateTime day, {DateTime? from, DateTime? startBusinessDay, int dayCnt = 60}) {
    from = from ?? DateTime.now();
    if (day.isBefore(from)) return false;
    startBusinessDay = startBusinessDay ?? getNextBusinessDay(from); // TODO ????????????????????????????????????
    DateTime lastBusinessDay = startBusinessDay.add(Duration(days: dayCnt));
    if (day.isAfter(lastBusinessDay)) return false;

    return true;
  }

  static bool isJapaneseHoliday(DateTime day) {
    try {
      return NHolidayJp.getName(day.year, day.month, day.day).isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  static String convertLevelToMark(int level) {
    if (level == 0) {
      return '??';
    } else if (level == 1) {
      return '???';
    } else {
      return '???';
    }
  }

  static Map<int, Availability> convertTimeAcceptableList(Map<String, TimeAcceptable> timeAcceptableList) {
    Map<int, Availability> res = {};
    int msPerHour = 60 * 60 * 1000;
    Map<int, List<AvailabilityItem>> map = {};
    timeAcceptableList.forEach((key, TimeAcceptable timeAcceptable) {
      List<String> list = timeAcceptable.date.split('-');
      DateTime timeAcceptableDate = DateTime(
        int.parse(list[0]),
        int.parse(list[1]),
        int.parse(list[2].substring(0, 2)),
      );
      int dateMs = timeAcceptableDate.millisecondsSinceEpoch;
      AvailabilityItem availabilityItem = AvailabilityItem(
        startDate: dateMs + timeAcceptable.start * msPerHour,
        endDate: dateMs + timeAcceptable.end * msPerHour,
        availabilityLevel: timeAcceptable.maxRegisterCnt - timeAcceptable.registerCnt,
      );

      if (!map.containsKey(dateMs)) {
        map[dateMs] = [availabilityItem];
      } else {
        map[dateMs] = [...map[dateMs]!, availabilityItem];
      }
    });

    map.forEach((key, availabilityItemList) {
      res[key] = Availability(items: availabilityItemList);
    });

    return res;
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
