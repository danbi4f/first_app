import 'package:flutter/material.dart';
import 'dart:math';

class FlipCardController {
  _FlipCardWidgetState? _state;

  Future flipCard() async => _state?.flipCard();
}

class Front extends StatefulWidget {
  const Front({super.key});

  @override
  State<Front> createState() => _FrontState();
}

class _FrontState extends State<Front> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                await controllerF.flipCard();
              },
              icon: const Icon(
                Icons.info,
                size: 40, 
              ),
            ),
            Image.network(
              'https://m.media-amazon.com/images/G/01/sm/sbg/prime-bagnara-gaming-loot-2-wh_1x.png', height: 100, 
            ),
            const Text(
              'Graj w gry',
              //style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.green[600]),
              onPressed: () {},
              child: const Text('ZARABIAJ'),
            ),
          ],
        ),
      ),
    );
    
  }
}

class Back extends StatefulWidget {
  const Back({super.key});

  @override
  State<Back> createState() => _BackState();
}

class _BackState extends State<Back> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Wynagrodzenie:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 5),
            Text(
              '1.00 - 50.00zł',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 5),
            Text(
              'za wykonanie zadania w grze',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            TextButton(
              onPressed: () async {
                await controllerF.flipCard();
              },
              child: const Text('COFNIJ'),
            ),
            
            Text(
              'Co muszę zrobić?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 5),
            Text(
              'Musisz zainstalować grę, którą lubisz i wykonać określone zadania w grze.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

Widget front = const Front();
Widget back = const Back();
final FlipCardController controllerF = FlipCardController();

class FlipCardWidget extends StatefulWidget {
  const FlipCardWidget({super.key});

  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controllerA;
  bool isFront = true;

  @override
  void initState() {
    super.initState();

    controllerA = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    controllerF._state = this;
  }

  @override
  void dispose() {
    controllerA.dispose();
    super.dispose();
  }

  Future flipCard() async {
    if (controllerA.isAnimating) return;
    isFront = !isFront;

    if (isFront) {
      await controllerA.reverse();
    } else {
      await controllerA.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controllerA,
        builder: (context, child) {
          final angle = controllerA.value * -pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle);

          return Transform(
            transform: transform,
            alignment: Alignment.center,
            child: isFrontImage(angle.abs())
                ? front
                : Transform(
                    transform: Matrix4.identity()..rotateY(pi),
                    alignment: Alignment.center,
                    child: back),
          );
        });
  }

  bool isFrontImage(double angle) {
    const degrees90 = pi / 2;
    const degrees270 = 3 * pi / 2;

    return angle <= degrees90 || angle >= degrees270;
  }
}
