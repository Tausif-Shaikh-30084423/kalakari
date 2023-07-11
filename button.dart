import 'package:flame/components.dart';
import 'package:flame/events.dart';

import '../gamer.dart';
import 'movement.dart';

class Button extends SpriteComponent with Tappable {
  Gamer? game;
  Movement movement = Movement.running;
  bool isTapped = false;
  @override
  bool onTapDown(TapDownInfo info) {
    try {
      print("Pressed");
      isTapped = !isTapped;
      isTapped ? movement = Movement.jump : movement = Movement.running;
      print(movement);
      return true;
    } catch (e) {
      print("Something went wrong $e");
      return false;
    }
  }
}
