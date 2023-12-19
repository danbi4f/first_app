import 'package:flutter/material.dart';
import 'package:paidwork_dummy/screens/drawer_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: const DrawerScreen(),
        appBar: AppBar(
          title: const Text('Ustawienia'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
              ),
            ),
          ],
          bottom: const TabBar(
            labelStyle: TextStyle(fontSize: 12),
            labelColor: Colors.black,
            tabs: [
              Tab(text: 'konto'),
              Tab(text: 'płatności'),
              Tab(text: 'Prywatność'),
              Tab(text: 'Informacje'),
            ],
          ),
        ),
        body: TabBarView(children: [
          Center(
              child: Column(children: []),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
        ]),
      ),
    );
  }
}
