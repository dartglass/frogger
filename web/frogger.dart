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
    //print('${gameLoop.frame}: ${gameLoop.gameTime} [dt = ${gameLoop.dt}].');
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

class Game {
  CanvasElement canvas;
  int height;
  int width;
  int tileHeight;
  int tileWidth;
  int lanes = 9;
  int rows = 5;

  CanvasRenderingContext2D ctx;

  Background background;
  Frogger frogger;
  List<Car> cars;
  TestGrid testGrid;

  Game(this.canvas) {
    ctx = canvas.getContext('2d');
    height = canvas.height;
    width = canvas.width;
    tileWidth = width ~/ lanes;
    tileHeight = height ~/ rows;

    print("canvas.height = $height");
    print("cavnas.width = $width");

    testGrid = new TestGrid(this, width, height);
    background = new Background(this);
    frogger = new Frogger(this);
    cars = new List<Car>();
    cars.add(new Car(this));
  }

  init() {

  }

  draw() {
    clear(ctx, width, height);
    testGrid.draw();
    background.draw();
    frogger.draw();
    cars.forEach((Car car) => car.draw());
  }
}

class Background {
  Game game;
  Background(this.game);
  draw() {

  }
}

class Frogger {
  Game game;
  int x;
  int y;

  Frogger(this.game) {
    x = 0;
    y = 2 * game.tileHeight;
  }
  draw() {
    int w = game.tileWidth;
    int h = game.tileHeight;
    game.ctx.fillStyle = "rgb(200,0,0)";
    game.ctx.fillRect(x, y, w, h);
  }

  update() {

  }
}

class Car {
  Game game;
  Car(this.game);
  draw() {

  }
}

class TestGrid {
  Game game;
  CanvasRenderingContext2D ctx;
  int lanes = 9;
  int rows = 5;
  int height;
  int width;
  int widthSpacing;
  int heightSpacing;

  TestGrid(this.game, this.width, this.height) {
    widthSpacing = (width/lanes).toInt();
    heightSpacing = (height/rows).toInt();
    print("heightSpacing = $heightSpacing");
    print("widthSpacing = $widthSpacing");
    ctx = game.ctx;
  }

  draw() {
    for (int row = 0; row < rows; row++) {
      drawTestLine(0, row * heightSpacing, width, 0);
    }

    for (int lane = 0; lane < lanes; lane++) {
      drawTestLine(lane * widthSpacing, 0, 0, height);
    }
  }

  void drawTestLine(x, y, changeX, changeY) {
    ctx.lineWidth = 10;
    ctx.lineCap = "round";
    ctx.strokeStyle = "white";
    ctx.beginPath();
    ctx.moveTo(x, y);

    ctx.lineTo(x + changeX, y + changeY);
    ctx.stroke();
    ctx.closePath();
  }
}