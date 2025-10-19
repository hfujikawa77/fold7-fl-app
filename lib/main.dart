import 'package:dual_screen/dual_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fold7_demo_fl/game_model.dart';
import 'package:fold7_demo_fl/game_screen.dart';
import 'package:fold7_demo_fl/ready_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameModel(),
      child: MaterialApp(
        title: 'Rock Paper Scissors',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gameModel = Provider.of<GameModel>(context, listen: false);

    return FutureBuilder<bool>(
      future: DualScreenInfo.hasHingeAngleSensor,
      builder: (context, snapshot) {
        if (snapshot.data == false) {
          return const Scaffold(
            body: Center(child: Text('Hinge angle sensor not available.')),
          );
        }
        return StreamBuilder<double>(
          stream: DualScreenInfo.hingeAngleEvents,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final hingeAngle = snapshot.data!;
              gameModel.updateHingeAngle(hingeAngle);

              if (hingeAngle > 170 &&
                  gameModel.gameState == GameState.ready &&
                  gameModel.userHand != null) {
                gameModel.playGame();
              } else if (hingeAngle < 170 &&
                  gameModel.gameState != GameState.ready) {
                gameModel.resetGame();
              }
            }

            return Consumer<GameModel>(
              builder: (context, gameModel, child) {
                switch (gameModel.gameState) {
                  case GameState.ready:
                    return const ReadyScreen();
                  case GameState.playing:
                  case GameState.result:
                    return const GameScreen();
                }
              },
            );
          },
        );
      },
    );
  }
}
