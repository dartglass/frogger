library main;

import 'dart:html';
import 'package:game_loop/game_loop_html.dart';

part 'background.dart';
part 'car.dart';
part 'frogger.dart';
part 'game.dart';
part 'test_grid.dart';

CanvasElement canvasElement;

clear(CanvasRenderingContext2D ctx, int width, int height) =>
  ctx.clearRect(0, 0, width, height);


void main() {
  canvasElement = query("#canvas");

  Game game = new Game(canvasElement);

  document.onKeyDown.listen((e){
    e.preventDefault();
    if(e.keyCode == 32){
      game.frogger.jump();
    }
  });

  // Construct a game loop.
  GameLoopHtml gameLoop = new GameLoopHtml(canvasElement);
  gameLoop.onUpdate = ((gameLoop) {
    // Update game logic here.
    //print('${gameLoop.frame}: ${gameLoop.gameTime} [dt = ${gameLoop.dt}].');
    game.update();
  });
  gameLoop.onRender = ((gameLoop) {
    // Draw game into canvasElement using WebGL or CanvasRenderingContext here.
    // The interpolation factor can be used to draw correct inter-frame
    //print('Interpolation factor: ${gameLoop.renderInterpolationFactor}');
    game.draw();
  });

  game.init();
  gameLoop.start();
}