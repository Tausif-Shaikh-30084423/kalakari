import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:shooter_flame_game/components/background_world.dart';
import 'package:shooter_flame_game/components/button.dart';
import 'package:shooter_flame_game/components/enemy.dart';
import 'package:shooter_flame_game/components/player.dart';

import 'components/bullet.dart';

Player player = Player();
BackGroundWorld backGroundWorldImage = BackGroundWorld();
Button button = Button();
Enemy enemy = Enemy();
Bullet bullet = Bullet(player);

class Gamer extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  @override
  Future<void> onLoad() async {
    add(backGroundWorldImage);
    add(player);
    add(enemy);
    add(bullet);
  }
}
