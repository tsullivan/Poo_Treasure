class Elephant {
  private short LEFT = 0;
  private short RIGHT = 1;
  private short _previousDirection = -1;
  private int _x = config.elephantSize + config.moveMargin;
  private int _lastMove = 0;

  private PShape elephantR;
  private PShape elephantL;

  Elephant() {
    elephantR = loadShape("Elephant-R.svg");
    elephantL = loadShape("Elephant-L.svg");
  }

  void draw() {
    PShape svg = elephantR;
    if (_previousDirection == LEFT) {
      svg = elephantL;
    }
    shape(svg, _x, config.elephantY, config.elephantSize, config.elephantSize);
  }

  float getSpeed(short direction) {
    int slowness = millis() - _lastMove;
    _lastMove = millis();

    float tempV = 0;
    if (slowness < config.elephantAccelerationTimeout && direction == _previousDirection) {
      tempV = ceil(config.elephantAccelerator * (config.elephantSlownessInverter / max(1, slowness)));
    }
    
    return min(config.elephantMaxSpeed, config.elephantSpeed + tempV);
  }

  void moveLeft() {
    int speed = ceil(getSpeed(LEFT));
    _x = max(_x - speed, config.moveMargin);
    _previousDirection = LEFT;
  }

  void moveRight() {
    int speed = ceil(getSpeed(RIGHT));
    _x = min(_x + speed, width - config.moveMargin);
    _previousDirection = RIGHT;
  }

  int getX() {
    return _x;
  }

  void poop(PoopSet p1) {
    int x = _x + config.poopXOffset;
    if (_previousDirection == LEFT) {
      x = _x + config.elephantSize - config.poopXOffset;
    }
    p1.add(x);
  }
}
