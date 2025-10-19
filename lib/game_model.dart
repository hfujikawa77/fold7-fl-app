import 'dart:math';
import 'package:flutter/material.dart';

enum GameState { ready, playing, result }

enum Hand { rock, paper, scissors }

enum GameResult { win, lose, draw }

class GameModel extends ChangeNotifier {
  GameState _gameState = GameState.ready;
  GameState get gameState => _gameState;

  Hand? userHand;
  Hand? computerHand;
  GameResult? result;

  int wins = 0;
  int losses = 0;
  int draws = 0;

  void playGame() {
    _gameState = GameState.playing;
    userHand = Hand.values[Random().nextInt(Hand.values.length)];
    computerHand = Hand.values[Random().nextInt(Hand.values.length)];

    if (userHand == computerHand) {
      result = GameResult.draw;
      draws++;
    } else if ((userHand == Hand.rock && computerHand == Hand.scissors) ||
        (userHand == Hand.paper && computerHand == Hand.rock) ||
        (userHand == Hand.scissors && computerHand == Hand.paper)) {
      result = GameResult.win;
      wins++;
    } else {
      result = GameResult.lose;
      losses++;
    }
    _gameState = GameState.result;
    notifyListeners();
  }

  void resetGame() {
    _gameState = GameState.ready;
    userHand = null;
    computerHand = null;
    result = null;
    notifyListeners();
  }
}
