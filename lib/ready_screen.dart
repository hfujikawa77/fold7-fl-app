import 'package:flutter/material.dart';

class ReadyScreen extends StatelessWidget {
  const ReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Open the device to play', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
