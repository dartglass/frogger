part of main;

class Car {
  Game game;
  int x;  
  int y;
  int column; // column position
  int _yTransformed;
  int speed;
  int direction;
  ImageElement image;

  Car(Game game, int x, int y, int type) {
    this.game = game;
    this.column = x;
    this.x = x * game.tileWidth;
    this.y = y;
    
    speed = 1;
        
    image = new Element.tag('img');
    
    switch(type){
      case 0: image.src = "images/car1-down.png"; direction = 1; break;
      case 1: image.src = "images/car1a-down.png"; direction = 1; break;
      case 2: image.src = "images/car1-up.png"; direction = -1; break;
      case 3: image.src = "images/car1a-up.png"; direction = -1; break;
      case 4: image.src = "images/truck2-up.png"; direction = -1; break;
      case 5: image.src = "images/truck2-down.png"; direction = 1; break;
      case 6: image.src = "images/log2.png"; direction = 1; break;
      case 7: image.src = "images/log3.png"; direction = -1; break;
      case 8: image.src = "images/log4.png"; direction = 1; break;
    }
    
    _yTransformed = (game.tileHeight * y) - image.height;
  }

  draw() {
    int w = game.tileWidth;
    int h = game.tileHeight;
    
    game.ctx.drawImage(image, x, _yTransformed);
   }

  update(GameLoop gameLoop) {
    _yTransformed = _yTransformed + (speed * direction);
    
    if(direction > 0){
      if(_yTransformed > game.height + image.height){
        _yTransformed = 0 - image.height;   
      }
    }
    else{
      if(_yTransformed < (image.height * -1)){
        _yTransformed = game.height + image.height;   
      }
    }
    num _yPos = (_yTransformed / game.tileHeight);
    if(game.frogger.x == column){
      if(_yPos > 1.0 && _yPos < 2.0){
        game.frogger.kill();  
      }
    }
  }
}