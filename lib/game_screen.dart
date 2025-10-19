import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fold7_demo_fl/game_model.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gameModel = Provider.of<GameModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Rock Paper Scissors')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Computer Hand: ${gameModel.computerHand?.name ?? ''}'),
            Text('User Hand: ${gameModel.userHand?.name ?? ''}'),
            Text('Result: ${gameModel.result?.name ?? ''}'),
            Text(
              'Score: W:${gameModel.wins} L:${gameModel.losses} D:${gameModel.draws}',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => gameModel.playGame(),
              child: const Text('Play Again'),
            ),
          ],
        ),
      ),
    );
  }
}
