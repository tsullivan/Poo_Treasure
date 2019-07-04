class Elephant {
  private short LEFT = 0x0;
  private short RIGHT = 0x1;
  private short UP = 0x2;
  private short DOWN = 0x3;

  private short _previousDirection = -1;
  private int _x = config.elephantSize + config.elephantXMargin;
  private int _y = config.elephantYMin;
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

    svg.disableStyle();
    noFill();
    color(config.elephantStrokeColor);
    strokeWeight(config.elephantStrokeWeight);
    shape(svg, _x, _y, config.elephantSize, config.elephantSize);
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
    _x = max(_x - ceil(getSpeed(LEFT)), config.elephantXMargin);
    _previousDirection = LEFT;
  }

  void moveRight() {
    _x = min(_x + ceil(getSpeed(RIGHT)), width - config.elephantXMargin);
    _previousDirection = RIGHT;
  }

  void moveUp() {
    _y = max(_y - ceil(getSpeed(UP)), config.elephantYMin);
    _previousDirection = UP;
  }

  void moveDown() {
    _y = min(_y + ceil(getSpeed(DOWN)), config.elephantYMax);
    _previousDirection = DOWN;
  }

  void poop(PoopSet p1) {
    int x = _x + config.poopXStartOffset;
    int y = _y;

    if (_previousDirection == LEFT) {
      x = _x + config.elephantSize - config.poopXStartOffset;
    }
    p1.add(x, y);
  }
}
