import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reservation/presentation/widget/reservation/reservation_form.dart';

import '../../widget/common/page_title.dart';

class ReservationPage extends ConsumerWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Back'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageTitle(title: 'Reservation Page'),
              const SizedBox(height: 20),
              ReservationForm(scrollController: scrollController),
            ],
          ),
        ),
      ),
    );
  }
}
