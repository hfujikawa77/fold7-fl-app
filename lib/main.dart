import 'package:flutter/material.dart';
import 'package:dual_screen/dual_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hinge Angle',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hinge Angle'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildFullScreenText(BuildContext context, String text) {
    return SizedBox.expand(
      child: LayoutBuilder(
        builder: (builderContext, constraints) {
          final size = constraints.biggest;
          final baseStyle = Theme.of(builderContext).textTheme.displayLarge ?? const TextStyle();
          final fontSize = (size.shortestSide) * 0.28;
          return FittedBox(
            fit: BoxFit.contain,
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: baseStyle.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<double>(
          stream: DualScreenInfo.hingeAngleEvents,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildFullScreenText(
                context,
                'Hinge Angle: ${snapshot.data!.toStringAsFixed(2)}',
              );
            } else {
              return _buildFullScreenText(
                context,
                'Waiting for hinge angle data...',
              );
            }
          },
        ),
      ),
    );
  }
}