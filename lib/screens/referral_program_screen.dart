import 'package:flutter/material.dart';
import 'package:paidwork_dummy/screens/drawer_screen.dart';



class ReferralProgramScreen extends StatelessWidget {
  const ReferralProgramScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: const Text('Program polecający'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
    );
  }
}