part of main;

class Frogger {
  Game game;
  int x;
  int y;
  
  bool splat;
  int splatX;
  int splatY;
  int splatCount;

  ImageElement froggerImage;
  ImageElement froggerSplatImage;
  
  VideoElement jumpSound;
  VideoElement killSound;

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
    killSound = query("#audioDead");
  }

  draw() {
    int w = game.tileWidth;
    int h = game.tileHeight;

    if(splat){
      game.ctx.drawImage(froggerSplatImage, splatX*w, h*2);
    }
    else{
      game.ctx.drawImage(froggerImage, x*w, h*2);
    }
  }

  jump(){
    if(splat) return;
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
    game.addScore(-1);
    killSound.play();
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