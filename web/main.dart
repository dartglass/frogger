library main;

import 'dart:html';
import 'package:game_loop/game_loop_html.dart';

part 'background.dart';
part 'car.dart';
part 'frogger.dart';
part 'game.dart';
part 'test_grid.dart';

CanvasElement canvasElement;

clear(CanvasRenderingContext2D ctx, int width, int height) =>
  ctx.clearRect(0, 0, width, height);


void main() {
  canvasElement = query("#canvas");

  Game game = new Game(canvasElement);
  
  bool jumpEnable = false;
  bool jumpTrigger = false;
  double jumpTime = 0.0;

  document.onKeyDown.listen((e){
    e.preventDefault();
    if(e.keyCode == 32){
      game.frogger.jump();
    }
  });

  // Construct a game loop.
  GameLoopHtml gameLoop = new GameLoopHtml(canvasElement);
  gameLoop.onUpdate = ((gameLoop) {
    // Update game logic here.
    //print('${gameLoop.frame}: ${gameLoop.gameTime} [dt = ${gameLoop.dt}].');
    
    //re-enable jumping
    if(jumpEnable == false){  
      double deltaJumpTime = gameLoop.gameTime - jumpTime; 
      if(deltaJumpTime > 1.0){
        jumpEnable = true;
      }
    }
    
    game.update();
  });
  
  gameLoop.onRender = ((gameLoop) {
    // Draw game into canvasElement using WebGL or CanvasRenderingContext here.
    // The interpolation factor can be used to draw correct inter-frame
    //print('Interpolation factor: ${gameLoop.renderInterpolationFactor}');
    game.draw();
  });

  game.init();
  gameLoop.start();
  
  //Handle glass motion events
  window.onDeviceMotion.listen((DeviceMotionEvent event) {
    num acc = event.accelerationIncludingGravity.z;
    
    // If head tilt is above the threshold then trigger a jump move
    if(acc >= 3.0 && jumpTrigger == false && jumpEnable == true){
      jumpTrigger = true;
      jumpTime = gameLoop.gameTime; 
      game.frogger.jump();
    }
    else if(acc < 0.0 && jumpTrigger == true){
      jumpTrigger = false;     
    }
  });
    
    
}