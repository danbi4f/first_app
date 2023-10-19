import 'package:flutter/material.dart';

class EstimatedEarnings extends StatelessWidget {
  const EstimatedEarnings({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Szacunkowe zarobki',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dzisiaj',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '0.00zł',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'wczoraj',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '0.00zł',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '0.00zł (+0%)',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'a ten sam dzień w zeszłym tygodniu',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ostatnie 7 dni',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '0.00zł',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '0.00zł ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'w porównaniu z poprzednimi 7 dniami',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'w tym miesiącu',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '0.00zł',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '0.00zł',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'w porównaniu z tym samym okresem ubiegłego roku',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
