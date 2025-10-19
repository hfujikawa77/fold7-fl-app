import 'package:flutter/material.dart';

class ReadyScreen extends StatelessWidget {
  const ReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.screen_rotation_outlined, size: 100),
            const SizedBox(height: 20),
            Text(
              'Open the device to play',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
