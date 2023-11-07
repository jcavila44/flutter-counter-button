import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  void onPressed() {
    setState(() {
      clickCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Counter functions')),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
              'Click${(clickCounter == 1) ? '' : 's'}',
              style: const TextStyle(fontSize: 25),
            ),
          ],
        )),
        // floatingActionButton: FloatingActionButton(onPressed: onPressed),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
                icon: Icons.refresh_rounded,
                ownOnPressedFunction: () {
                  setState(() {
                    clickCounter = 0;
                  });
                }),
            const SizedBox(height: 15),
            CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              ownOnPressedFunction: () {
                setState(() {
                  if (clickCounter == 0) return;
                  clickCounter--;
                });
              },
            ),
            const SizedBox(height: 15),
            CustomButton(
              icon: Icons.plus_one,
              ownOnPressedFunction: () {
                setState(() {
                  clickCounter++;
                });
              },
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? ownOnPressedFunction;

  const CustomButton({
    super.key,
    required this.icon,
    this.ownOnPressedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: ownOnPressedFunction,
      child: Icon(icon),
    );
  }
}
