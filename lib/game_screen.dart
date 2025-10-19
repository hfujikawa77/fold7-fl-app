import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fold7_demo_fl/game_model.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  String _getHandAsciiArt(Hand hand) {
    switch (hand) {
      case Hand.rock:
        return '''
    _______
---'   ____)
      (_____)
      (_____)
      (____)
---.__(___)
        ''';
      case Hand.paper:
        return '''
     _______
---'    ____)____
           ______)
          _______)
         _______)
---.__________)
        ''';
      case Hand.scissors:
        return '''
    _______
---'   ____)____
          ______)
       __________)
      (____)
---.__(___)
        ''';
    }
  }

  @override
  Widget build(BuildContext context) {
    final gameModel = Provider.of<GameModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rock Paper Scissors'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              opacity: gameModel.gameState == GameState.result ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Column(
                children: [
                  Text(
                    'COMPUTER',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (gameModel.computerHand != null)
                    Text(
                      _getHandAsciiArt(gameModel.computerHand!),
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  Text(
                    gameModel.computerHand?.name.toUpperCase() ?? '',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            AnimatedOpacity(
              opacity: gameModel.gameState == GameState.result ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Text(
                gameModel.result == GameResult.win
                    ? 'YOU WIN!'
                    : gameModel.result == GameResult.lose
                    ? 'YOU LOSE!'
                    : 'DRAW!',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
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
            AnimatedOpacity(
              opacity: gameModel.gameState == GameState.result ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Column(
                children: [
                  Text(
                    'YOU',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (gameModel.userHand != null)
                    Text(
                      _getHandAsciiArt(gameModel.userHand!),
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  Text(
                    gameModel.userHand?.name.toUpperCase() ?? '',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
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
                onPressed: () => gameModel.resetGame(),
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
