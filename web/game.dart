part of main;

class Game {
  CanvasElement canvas;
  int height;
  int width;
  int tileHeight;
  int tileWidth;
  int lanes = 9;
  int rows = 5;
  int gameScore = 0;

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
    
    cars.add(new Car(this, 3, 0, 0));
    cars.add(new Car(this, 4, 2, 2));
    cars.add(new Car(this, 4, 4, 3));
    cars.add(new Car(this, 1, 0, 4));
    
    cars.add(new Car(this, 6, 0, 6));
    cars.add(new Car(this, 6, 2, 6));
    
    cars.add(new Car(this, 7, 2, 7));
    
  }

  init() {

  }

  draw() {
    clear(ctx, width, height);
    testGrid.draw();
    background.draw();
    frogger.draw();
    cars.forEach((Car car) => car.draw());
    drawScore();
  }

  update(GameLoop gameLoop) {
    frogger.update(gameLoop);
    cars.forEach((Car car) => car.update(gameLoop));
  }

  addScore(int val){
    gameScore += val;
  }
  
  drawScore(){
    ctx.strokeText(gameScore.toString(), 10, 15, 100);
  }
  

}