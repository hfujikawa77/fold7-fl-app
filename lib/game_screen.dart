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
            AnimatedOpacity(
              opacity: gameModel.gameState == GameState.result ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Text(
                'Computer Hand: ${gameModel.computerHand?.name ?? ''}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              opacity: gameModel.gameState == GameState.result ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Text(
                'User Hand: ${gameModel.userHand?.name ?? ''}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              opacity: gameModel.gameState == GameState.result ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Text(
                'Result: ${gameModel.result?.name ?? ''}',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: gameModel.result == GameResult.win
                      ? Colors.green
                      : gameModel.result == GameResult.lose
                      ? Colors.red
                      : Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Score: W:${gameModel.wins} L:${gameModel.losses} D:${gameModel.draws}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 40),
            if (gameModel.gameState == GameState.result)
              ElevatedButton(
                onPressed: () => gameModel.playGame(),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  textStyle: Theme.of(context).textTheme.titleLarge,
                ),
                child: const Text('Play Again'),
              ),
          ],
        ),
      ),
    );
  }
}
