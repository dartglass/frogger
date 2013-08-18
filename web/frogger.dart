part of main;

class Frogger {
  Game game;
  int x;
  int y;
  int _i=0;
  int position;
  ImageElement froggerImage;

  Frogger(this.game) {
    x = 0;
    y = 2 * game.tileHeight;

    position = 0;
    froggerImage = new Element.tag('img');
    froggerImage.src = "images/and.png";
  }

  draw() {
    int w = game.tileWidth;
    int h = game.tileHeight;

    game.ctx.drawImage(froggerImage, position*w, h*2);
  }

  jump(){
    position++;
    if(position >= 9){
      //Frog made it across
      position = 0;
    }
  }

  update() {
//    // TEST:
//    x = (_i%9) * game.tileWidth;
//    _i++;
  }
}