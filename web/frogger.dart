import 'dart:html';
import 'package:game_loop/game_loop_html.dart';

void main() {
  CanvasElement canvasElement = query("#canvas");

  // Construct a game loop.
  GameLoopHtml gameLoop = new GameLoopHtml(canvasElement);
  gameLoop.onUpdate = ((gameLoop) {
    // Update game logic here.
    print('${gameLoop.frame}: ${gameLoop.gameTime} [dt = ${gameLoop.dt}].');
  });
  gameLoop.onRender = ((gameLoop) {
    // Draw game into canvasElement using WebGL or CanvasRenderingContext here.
    // The interpolation factor can be used to draw correct inter-frame
    print('Interpolation factor: ${gameLoop.renderInterpolationFactor}');
  });
  gameLoop.start();
}
