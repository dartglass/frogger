import 'dart:html';
import 'package:game_loop/game_loop_html.dart';

CanvasElement canvasElement;

clear(CanvasRenderingContext2D ctx, int width, int height) =>
  ctx.clearRect(0, 0, width, height);


void main() {
  canvasElement = query("#canvas");

  Game game = new Game(canvasElement);

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
    game.draw();
  });

  game.init();
  gameLoop.start();
}

class Game {
  CanvasElement canvas;
  int height;
  int width;
  CanvasRenderingContext2D ctx;

  Background background;

  Game(this.canvas) {
    ctx = canvas.getContext('2d');
    height = canvas.height;
    width = canvas.width;

    background = new Background(this);
  }

  init() {

  }

  draw() {
    clear(ctx, width, height);

    background.draw();
  }
}

class Background {
  Game game;
  Background(this.game);
  draw() {

  }
}