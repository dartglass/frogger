part of main;

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
    ctx.lineWidth = 1;
    ctx.lineCap = "round";
    ctx.strokeStyle = "white";
    ctx.beginPath();
    ctx.moveTo(x, y);

    ctx.lineTo(x + changeX, y + changeY);
    ctx.stroke();
    ctx.closePath();
  }
}