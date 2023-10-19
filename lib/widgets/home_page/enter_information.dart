import 'package:flutter/material.dart';


class EnterInformation extends StatelessWidget {
  const EnterInformation({super.key});

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
              'Dodaj podstawowe informacje o sobie',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'wyświetlaj lepiej płatne reklamy, aby zarabiać.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 20),
            Image.asset('assets/add_2.png'),
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