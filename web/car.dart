part of main;

class Car {
  Game game;
  int x;
  int y;
  int _i = 0;

  Car(Game game, int x, int y) {
    this.game = game;
    this.x = x * game.tileWidth;
    this.y = y;
  }

  draw() {
    int w = game.tileWidth;
    int h = game.tileHeight;
    game.ctx.fillStyle = "rgb(200,200,0)";
    game.ctx.fillRect(x, y, w, h);
  }

  update() {
    // TEST:
    y = (_i%5) * game.tileHeight;
    _i++;
  }
}