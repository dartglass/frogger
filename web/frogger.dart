part of main;

class Frogger {
  Game game;
  int x;
  int y;
  int _i=0;
  
  bool splat;
  int splatX;
  int splatY;
  int splatCount;

  ImageElement froggerImage;
  ImageElement froggerSplatImage;
  
  VideoElement jumpSound;

  Frogger(this.game) {
    x = 0;
    y = 2 * game.tileHeight;
    splat = false;
    splatCount = 0;

    froggerImage = new Element.tag('img');
    froggerImage.src = "images/frogger.png";
    
    froggerSplatImage = new Element.tag('img');
    froggerSplatImage.src = "images/frogger-splat.png";
    
    jumpSound = query("#audioJump");
  }

  draw() {
    int w = game.tileWidth;
    int h = game.tileHeight;

    game.ctx.drawImage(froggerImage, x*w, h*2);
    
    if(splat){
      game.ctx.drawImage(froggerSplatImage, splatX*w, h*2);
    }
  }

  jump(){
    x++;
    if(x >= game.lanes){
      //Frog made it across
      x = 0;
      game.addScore(1);
    }

    jumpSound.play();
  }

  // Kill the frog
  kill(){
    //Frog died
    splatX = x;
    splatY = y;
    
    x = 0;
    splat = true;
  }


  update(GameLoop gameLoop) {
    if(splat){
      splatCount++;
      if(splatCount > 100){
        splatCount = 0;
        splat = false;
      }
    }
  }
}