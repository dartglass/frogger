//have frameNumber
// car pictures
  // 1: 1 spot car
  // 2: front of van
  // 3: end of van
  // 4: front of truck
  // 5: middle of truck
  // 6: end of truck
//down
List<int> cars0 = [1, 0, 2, 3, 1, 0, 0, 0, 4, 5, 6, 1, 0, 0, 0, 1, 0, 0, 1, 0];

//down, up
List<int> cars1 = [0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0];
List<int> cars2 = [1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1];

// log pictures
  // 1: small log (no connect)
  // 2: end of log connect bottom
  // 3: middle of log (connect top and bottom)
  // 4: end of log connect top
//up, down
List<int> cars3 = [0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0];
List<int> cars4 = [1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1];

//multiple pixelUnits by subFrame to get offset
int pixelUnits = 4;
int squareHeight = 48; //height of picture
int squareWidth = 44;
int startOfFrogLane = 96;

//i corresponds to -3 through +2
void drawCar(int car, int subFrame, int direction, int h, int v) {
  if (!car) {
    return;
  }

  int y = startOfFrogLane + direction * (subFrame * pixelUnits + v * squareHeight);
  int x = h * squareWidth;

  //invoke draw of car or log here
}

int carIndex(int frame, int offset) {
  int r = frame + offset;
  return (r % 20);
}

void drawColumn(int frame, int subFrame, List<int> cars, int direction, int h) {
  int v, c;
  for (v = -2; v < 4; v++) {
    c = cars[carIndex(frame, direction * v)];
    drawCar(c, subFrame, direction, h, v);
  }
}

void drawColumnDown(int frame, int subFrame, List<int> cars, int h) {
  drawColumn(frame, subFrame, cars, 1, h);
}

void drawColumnUp(int frame, int subFrame, List<int> cars, int h) {
  drawColumn(frame, subFrame, cars, -1, h);
}

void drawCars(int frame, int subFrame) {
  //frame is which array index is in the frogRow
  //subFrame is how far off to draw
  drawColumnDown(frame, subFrame, cars0, 1);
  drawColumnDown(frame, subFrame, cars1, 3);
  drawColumnUp(frame, subFrame, cars2, 4);
  drawColumnUp(frame, subFrame, cars3, 6);
  drawColumnDown(frame, subFrame, cars4, 7);
}