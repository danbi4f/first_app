import 'package:flutter/material.dart';

class ConfirmEmail extends StatelessWidget {
  const ConfirmEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Zweryfikuj swój email',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'odwiedź swoją pocztę i kliknij w link aktywacyjny',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 20),
            Image.network(
              'https://img.freepik.com/premium-vector/secure-email-otp-authentication-verification-method_258153-468.jpg',
            ),
            TextButton(
              onPressed: () {},
              child: const Text('PRZEJDŹ DO USTAWIEŃ'),
            ),
          ],
        ),
      ),
    );
  }
}