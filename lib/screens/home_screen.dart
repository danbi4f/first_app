import 'package:flutter/material.dart';
import 'package:paidwork_dummy/screens/drawer_screen.dart';
import 'package:paidwork_dummy/widgets/home_page/balance.dart';
import 'package:paidwork_dummy/widgets/home_page/confirm_email.dart';
import 'package:paidwork_dummy/widgets/home_page/enter_information.dart';
import 'package:paidwork_dummy/widgets/home_page/estimated_earnings.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('strona główna'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
      drawer: const DrawerScreen(),
      body: Column(
      children: [
        Expanded(
          child: ListView(
            children: const [
              EstimatedEarnings(),
              Balance(),
              ConfirmEmail(),
              EnterInformation(),
            ],
          ),
        ),
      ],
    ),
    );
  }
}
