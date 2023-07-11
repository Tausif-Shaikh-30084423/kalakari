import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:shooter_flame_game/components/bullet.dart';
import 'package:shooter_flame_game/gamer.dart';

class Enemy extends SpriteComponent with HasGameRef, CollisionCallbacks {
  Enemy() : super(size: Vector2.all(50));
  final double _moveSpeed = 300;
  final int _horizontalDirection = 1;
  Random pos = Random();
  double posx = 175, posy = 0.0;
  final Vector2 _velocity = Vector2.zero();
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('angry_bird.png');
    addPosition(posx, posx);
    add(CircleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Bullet) {
      bullet.onLoad();
      print('NONO');
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    _velocity.y = _horizontalDirection * _moveSpeed;
    if (position.y >= 620) {
      //_velocity.y = 0;
      addPosition(
        pos.nextDouble() * 235,
        0.0,
      );
    }
    position += _velocity * dt;
  }

  void addPosition(double posx, posy) {
    position = Vector2(posx, posy);
  }
}
