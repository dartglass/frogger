part of main;

class Frogger {
  Game game;
  int x;
  int y;
  int _i=0;

  ImageElement froggerImage;

  Frogger(this.game) {
    x = 0;
    y = 2 * game.tileHeight;

    froggerImage = new Element.tag('img');
    froggerImage.src = "images/and.png";
  }

  draw() {
    int w = game.tileWidth;
    int h = game.tileHeight;

    game.ctx.drawImage(froggerImage, x*w, h*2);
  }

  jump(){
    x++;
    if(x >= game.lanes){
      //Frog made it across
      x = 0;
      game.addScore(1);
    }
  }
  
  // Kill the frog
  kill(){
    //Frog died
    x = 0;    
  }

  update() {
//    // TEST:
//    x = (_i%9) * game.tileWidth;
//    _i++;
  }
}