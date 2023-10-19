import 'package:flutter/material.dart';
import 'package:paidwork_dummy/screens/drawer_screen.dart';
import 'package:paidwork_dummy/widgets/make_money/flip_card_widget.dart';

class MakeMoneyScreen extends StatefulWidget {
  const MakeMoneyScreen({super.key});

  @override
  State<MakeMoneyScreen> createState() => _MakeMoneyScreenState();
}

class _MakeMoneyScreenState extends State<MakeMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: const Text('zarabiaj'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
      body: ListView(
        //padding: const EdgeInsets.all(10),
        children: const [
          FlipCardWidget(),
        ],
      ),
    );
  }
}
