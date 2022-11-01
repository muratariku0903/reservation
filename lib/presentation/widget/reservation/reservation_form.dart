import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'reservation_calendar.dart';

class ReservationForm extends ConsumerWidget {
  const ReservationForm({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalObjectKey<ReservationCalendarState> calendarKey = GlobalObjectKey<ReservationCalendarState>(context);

    void setValidationStatus(_ValidationStatus validationStatus) {
      ref.watch(_ScreenState.validationStatusProvider.notifier).state = validationStatus;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('Select date of reservation.'),
            const SizedBox(height: 20),
            ReservationCalendar(
              key: calendarKey,
              cardTapCallback: () => setValidationStatus(_ValidationStatus.clear),
              scrollController: scrollController,
            ),
            if (ref.watch(_ScreenState.validationStatusProvider) == _ValidationStatus.error)
              Container(
                color: Colors.deepOrange,
                height: 100,
                alignment: Alignment.center,
                child: const Text('error'),
              ),
            TextButton(
              onPressed: () {
                if (calendarKey.currentState!.value() == null) {
                  setValidationStatus(_ValidationStatus.error);
                }
              },
              child: const Text(
                'confirm',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScreenState {
  static final validationStatusProvider = StateProvider<_ValidationStatus>((ref) => _ValidationStatus.none);
}

enum _ValidationStatus { none, error, clear }
