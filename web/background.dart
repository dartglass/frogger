part of main;

class Background {
  Game game;
  ImageElement backgroundImage;
  Background(this.game) {
    backgroundImage = new Element.tag('img');
    backgroundImage.src = "images/game-field.jpg";
  }
  draw() {
    game.ctx.drawImage(backgroundImage, 0, 0);
  }
}