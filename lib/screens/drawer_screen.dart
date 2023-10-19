import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paidwork_dummy/main.dart';
import 'package:paidwork_dummy/screens/analytics_screen.dart';
import 'package:paidwork_dummy/screens/home_screen.dart';
import 'package:paidwork_dummy/screens/make_money_screen.dart';
import 'package:paidwork_dummy/screens/payments_screen.dart';
import 'package:paidwork_dummy/screens/referral_program_screen.dart';
import 'package:paidwork_dummy/screens/settings_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const myDivider = Divider(color: Colors.black12);

    return Drawer(
      backgroundColor: kColorSheme.secondaryContainer,
      child: Column(
        children: [
          Container(
            height: 30,
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 40, bottom: 20),
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.money),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Paidwork',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(
              'Strona główna',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyApp(),
                ),
              );
            },
            selected: true,
          ),
          ListTile(
            leading: const Icon(Icons.money),
            title: Text(
              'Zarabiaj',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () {
              Navigator.of(context).pop;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const MakeMoneyScreen()),
                ),
              );
            },
            selected: true,
          ),
          myDivider,
          ListTile(
            leading: const Icon(Icons.analytics),
            title: Text(
              'Analityka',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () {
              Navigator.of(context).pop;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const AnalyticsScreen()),
                ),
              );
            },
            selected: true,
          ),
          ListTile(
            leading: const Icon(Icons.payment_rounded),
            title: Text(
              'Płatności',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () {
              Navigator.of(context).pop;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const PaymentsScreen()),
                ),
              );
            },
            selected: true,
          ),
          myDivider,
          ListTile(
            leading: const Icon(Icons.recommend),
            title: Text(
              'Program polecający',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () {
              Navigator.of(context).pop;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const ReferralProgramScreen()),
                ),
              );
            },
            selected: true,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              'Ustawienia',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () {
              Navigator.of(context).pop;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const SettingsScreen()),
                ),
              );
            },
            selected: true,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(
              'Wyloguj',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            selected: true,
          ),
        ],
      ),
    );
  }
}
