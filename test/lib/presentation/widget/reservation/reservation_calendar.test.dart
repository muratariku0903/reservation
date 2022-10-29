import 'package:reservation/presentation/widget/reservation/reservation_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('isHoliday:祝日判定', () {
    test('正常形:日月が祝日になる', () {
      expect(ReservationCalendarState.isHoliday(DateTime(2022, 10, 30)), true);
      expect(ReservationCalendarState.isHoliday(DateTime(2022, 10, 31)), true);
    });

    test('正常形:日本の祝日判定', () {
      expect(ReservationCalendarState.isHoliday(DateTime(2022, 11, 3)), true);
    });

    test('異常形:日月以外が祝日にならない', () {
      expect(ReservationCalendarState.isHoliday(DateTime(2022, 10, 25)), false);
    });
  });

  group('isValidRangeDay:指定された日時が有効範囲内かの判定', () {
    test('正常形:有効範囲内', () {
      expect(
        ReservationCalendarState.isValidRangeDay(DateTime(2022, 11, 15), from: DateTime(2022, 11, 1), dayCnt: 60),
        true,
      );
    });

    test('正常形:境界値（指定値した日時が有効範囲の開始日と同じ）で有効範囲内', () {
      expect(
        ReservationCalendarState.isValidRangeDay(DateTime(2022, 11, 1), from: DateTime(2022, 11, 1), dayCnt: 60),
        true,
      );
    });

    test('正常形:境界値（指定値した日時が有効範囲の最終日と同じ）で有効範囲内', () {
      expect(
        ReservationCalendarState.isValidRangeDay(DateTime(2022, 11, 16), from: DateTime(2022, 11, 1), dayCnt: 15),
        true,
      );
    });

    test('異常形:有効範囲外', () {
      expect(
        ReservationCalendarState.isValidRangeDay(DateTime(2022, 11, 15), from: DateTime(2022, 11, 1), dayCnt: 10),
        false,
      );
    });

    test('異常形:境界値（指定値した日時が有効範囲の開始日より1日前）で有効範囲内', () {
      expect(
        ReservationCalendarState.isValidRangeDay(DateTime(2022, 10, 31), from: DateTime(2022, 11, 1), dayCnt: 60),
        false,
      );
    });

    test('異常形:境界値（指定値した日時が有効範囲の最終日より1日後）で有効範囲内', () {
      expect(
        ReservationCalendarState.isValidRangeDay(DateTime(2022, 11, 17),
            startBusinessDay: DateTime(2022, 11, 1), dayCnt: 15),
        false,
      );
    });
  });

  group('getNextBusinessDay:翌営業日取得', () {
    test('翌日が翌営業日', () {
      expect(ReservationCalendarState.getNextBusinessDay(DateTime(2022, 10, 11)), DateTime(2022, 10, 12));
    });

    test('翌日が日曜日', () {
      expect(ReservationCalendarState.getNextBusinessDay(DateTime(2022, 10, 22)), DateTime(2022, 10, 25));
    });

    test('翌日が祝日', () {
      expect(ReservationCalendarState.getNextBusinessDay(DateTime(2022, 11, 22)), DateTime(2022, 11, 24));
    });

    test('翌日が連続して祝日', () {
      expect(ReservationCalendarState.getNextBusinessDay(DateTime(2023, 5, 2)), DateTime(2023, 5, 6));
    });
  });
}
