import 'package:flutter/material.dart';


class Balance extends StatelessWidget {
  const Balance({super.key});

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
              'Saldo',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              '0.00zł',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'ostatnia płatność',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '0.00',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}