import 'package:flutter/material.dart';
import 'package:reservation/presentation/widget/signup/form/form.dart';

import '../../widget/common/page_title.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            PageTitle(title: 'Reservation Page'),
            SizedBox(height: 20),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}
