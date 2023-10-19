import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paidwork_dummy/screens/auth/auth_screen.dart';
import 'package:paidwork_dummy/screens/home_screen.dart';
// import 'package:paidwork_dummy/screens/make_money_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final dColorShame =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 82, 204));
final kColorSheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 82, 204));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  return runApp(
    MaterialApp(
      color: kColorSheme.background,
      theme: ThemeData().copyWith(
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  color: kColorSheme.onSecondaryContainer,
                  fontSize: 19,
                ),
                titleMedium: TextStyle(
                    color: kColorSheme.onSecondaryContainer,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
                bodyMedium: TextStyle(
                    color: kColorSheme.onSecondaryContainer,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
                bodySmall: TextStyle(
                    color: kColorSheme.onSecondaryContainer,
                    fontSize: 10,
                    fontWeight: FontWeight.normal),
              ),
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorSheme.secondaryContainer,
            foregroundColor: kColorSheme.onPrimaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorSheme.secondaryContainer,
          )),
      home:
          // const MyApp(),
          // MakeMoneyScreen(),
          //const AuthScreen(),
          StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const MyApp();
                }

                return const AuthScreen();
              }),
    ),
  );
}
