import 'package:flutter/material.dart';
import 'package:paidwork_dummy/main.dart';
import 'package:paidwork_dummy/screens/auth/auth_screen_register.dart';
import 'package:paidwork_dummy/screens/auth/forgotten_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paidwork_dummy/screens/home_screen.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  var _enteredEmail = '';

  var _enteredPassword = '';

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();
    }
    try {
      final userCredentials = _firebase.signInWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPassword);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        // ...
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Uwierzytelnianie nie powiodło się'),
        ),
      );

      
    }

   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorSheme.onPrimary,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 50,
                bottom: 40,
                left: 20,
                right: 20,
              ),
              width: 500,
              child: Row(
                children: [
                  const Text('Polski'),
                  const Spacer(),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AuthScreenRegister(),
                        ),
                      );
                    },
                    child: const Text('Rejestracja'),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.money,
              size: 80,
            ),
            const Text(
              'Witaj ponownie.',
              style: TextStyle(fontSize: 25),
            ),
            Card(
              color: kColorSheme.onPrimary,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Email'),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              !value.contains('@')) {
                            return 'Email is invalid';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredEmail = value!;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('hasło'),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.trim().length < 6) {
                            return 'Enter 8 or more characters';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredPassword = value!;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 300,
              height: 70,
              child: ElevatedButton(
                onPressed: _submit,
                child: const Text('Zaloguj się'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ForgottenPassword(),
                  ),
                );
              },
              child: const Text('Zapomniałeś hasła?'),
            ),
          ],
        ),
      ),
    );
  }
}
