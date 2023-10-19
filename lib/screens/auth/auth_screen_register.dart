import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paidwork_dummy/main.dart';
import 'package:paidwork_dummy/screens/auth/auth_screen.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreenRegister extends StatefulWidget {
  const AuthScreenRegister({super.key});

  @override
  State<AuthScreenRegister> createState() => _AuthScreenRegisterState();
}

class _AuthScreenRegisterState extends State<AuthScreenRegister> {
  final _formKey = GlobalKey<FormState>();

  var _enteredEmail = '';

  var _enteredPassword = '';

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();
    }

    try {
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPassword);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        // ...
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Uwierzytelnianie nie powiodło się'),
        ),
      );
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      ),
    );
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
                          builder: (context) => const AuthScreen(),
                        ),
                      );
                    },
                    child: const Text('Zaloguj się'),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.money,
              size: 80,
            ),
            const Text(
              'Utwórz konto, aby zacząć zarabiać.',
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
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
                child: const Text('Rejestracja'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
