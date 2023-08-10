import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:shooter_flame_game/components/enemy.dart';
import 'package:shooter_flame_game/components/player.dart';
import 'package:shooter_flame_game/gamer.dart';

class Bullet extends SpriteComponent with HasGameRef, CollisionCallbacks {
  Bullet(this.player) : super(size: Vector2.all(20));
  // double posx;
  // double? posy;
  Player? player;

  final double _moveSpeed = 300;
  final int _verticalDirection = 1;
  final Vector2 _velocity = Vector2.zero();
  Random random = Random();
  var anotherBullet;

  @override
  Future<void> onLoad() async {
    // var myPlayer = player;
    anotherBullet = Bullet(player);
    sprite = await gameRef.loadSprite('bullet.png');
    //position = Vector2(185, 655);
    addPosition(player?.x, player?.y);
    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    if (other is Enemy) {
      enemy.addPosition(random.nextDouble() * 256, 0.0);
      print('YESS');
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);
    position -= _velocity * dt;
    _velocity.y = _verticalDirection * _moveSpeed;

    if (position.y <= 0) {
      addPosition(player?.x, player?.y);
    }
    if (position.y >= 500.0) {
      await add(anotherBullet);
      print('bye');
    }
    print(position.y);
  }

  void addPosition(double? posx, double? posy) {
    position = Vector2(posx ?? 0, posy ?? 0);
  }
}
