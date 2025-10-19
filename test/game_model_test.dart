import 'package:flutter_test/flutter_test.dart';
import 'package:fold7_demo_fl/game_model.dart';

void main() {
  group('GameModel', () {
    late GameModel gameModel;

    setUp(() {
      gameModel = GameModel();
    });

    test('initial state is correct', () {
      expect(gameModel.gameState, GameState.ready);
      expect(gameModel.userHand, isNull);
      expect(gameModel.computerHand, isNull);
      expect(gameModel.result, isNull);
      expect(gameModel.wins, 0);
      expect(gameModel.losses, 0);
      expect(gameModel.draws, 0);
    });

    test('playGame updates state correctly', () {
      gameModel.playGame();

      expect(gameModel.gameState, GameState.result);
      expect(gameModel.userHand, isNotNull);
      expect(gameModel.computerHand, isNotNull);
      expect(gameModel.result, isNotNull);

      if (gameModel.result == GameResult.win) {
        expect(gameModel.wins, 1);
        expect(gameModel.losses, 0);
        expect(gameModel.draws, 0);
      } else if (gameModel.result == GameResult.lose) {
        expect(gameModel.wins, 0);
        expect(gameModel.losses, 1);
        expect(gameModel.draws, 0);
      } else {
        expect(gameModel.wins, 0);
        expect(gameModel.losses, 0);
        expect(gameModel.draws, 1);
      }
    });

    test('resetGame resets the state', () {
      gameModel.playGame();
      gameModel.resetGame();

      expect(gameModel.gameState, GameState.ready);
      expect(gameModel.userHand, isNull);
      expect(gameModel.computerHand, isNull);
      expect(gameModel.result, isNull);
    });
  });
}
