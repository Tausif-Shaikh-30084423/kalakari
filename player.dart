import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shooter_flame_game/components/enemy.dart';

class Player extends SpriteComponent
    with HasGameRef, KeyboardHandler, CollisionCallbacks {
  Player() : super(size: Vector2.all(50));
  final double _moveSpeed = 300;
  int _horizontalDirection = 0;
  final Vector2 _velocity = Vector2.zero();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('Bird.png');
    position = Vector2(180, 665);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
    if (other is Enemy) {
      print("hello");
    }
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    _horizontalDirection = 0;

    _horizontalDirection += (keysPressed.contains(LogicalKeyboardKey.keyF) ||
            keysPressed.contains(LogicalKeyboardKey.arrowLeft))
        ? -1
        : 0;
    _horizontalDirection += (keysPressed.contains(LogicalKeyboardKey.keyB) ||
            keysPressed.contains(LogicalKeyboardKey.arrowRight))
        ? 1
        : 0;
    if (position.x >= 350) {
      if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
        // _horizontalDirection += -1;
        _velocity.x = _horizontalDirection * _moveSpeed;
      }
    }
    if (position.x <= 0) {
      if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
        // _horizontalDirection += -1;
        _velocity.x = _horizontalDirection * _moveSpeed;
      }
    }

    return true;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += _velocity * dt;
    // bullet.posx = position.x;
    // bullet.posy = position.y;
    _velocity.x = _horizontalDirection * _moveSpeed;
    if (position.x >= 350 || position.x <= 0) {
      _velocity.x = 0;
    }
  }
}
