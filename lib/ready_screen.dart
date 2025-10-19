import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fold7_demo_fl/game_model.dart';

class ReadyScreen extends StatelessWidget {
  const ReadyScreen({super.key});

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
          children: [
            Text(
              'Choose your hand',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: Hand.values.map((hand) {
                final isSelected = gameModel.userHand == hand;
                return GestureDetector(
                  onTap: () => gameModel.selectUserHand(hand),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.grey,
                        width: isSelected ? 4 : 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: isSelected
                          ? Colors.blue.withValues(alpha: 0.1)
                          : Colors.transparent,
                    ),
                    child: Column(
                      children: [
                        Text(
                          _getHandAsciiArt(hand),
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.blue : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          hand.name.toUpperCase(),
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.blue : Colors.black,
                              ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 40),
            Text(
              'Score: W:${gameModel.wins} L:${gameModel.losses} D:${gameModel.draws}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            if (gameModel.userHand != null) ...[
              const Icon(
                Icons.screen_rotation_outlined,
                size: 60,
                color: Colors.green,
              ),
              const SizedBox(height: 10),
              Text(
                'Open the device to play!',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
