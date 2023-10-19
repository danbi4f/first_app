import 'package:flutter/material.dart';
import 'package:paidwork_dummy/main.dart';

class ForgottenPassword extends StatelessWidget {
  const ForgottenPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorSheme.onPrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.money, size: 50),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: Text(
                'Masz problem z zalogowaniem się?',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: Text(
                'Podaj dodatkowe informacje, aby pomóc w procesie odzyskiwania konta.',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 280,
              height: 50,
              child: Form(
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
