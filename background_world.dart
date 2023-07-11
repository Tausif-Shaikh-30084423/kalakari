import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/cupertino.dart';

class BackGroundWorld extends SpriteComponent with HasGameRef {
  // GameController controller;
  Rect? background;
  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('background.png');
    size = gameRef.size;
    var images = [
      gameRef.loadParallaxImage('background.png',
          fill: LayerFill.width, repeat: ImageRepeat.noRepeat),
    ];
    final layers = images.map((image) async => ParallaxLayer(
          await image,
          velocityMultiplier:
              images.indexOf(image) == 0 ? Vector2(20, 0) : Vector2(0, 0),
        ));

    // Create parallax
    final parallaxComponent = ParallaxComponent(
      parallax: Parallax(
        await Future.wait(layers),
        baseVelocity: Vector2(1, 0),
      ),
    );

    // Add parallax to game
  }
  //background = Rect.fromLTWH(0, 0, width, height);
}
