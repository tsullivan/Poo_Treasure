class Elephant {
  private PShape _svgR;
  private PShape _svgL;

  private short _previousDirection = -1;
  private int _x = config.elephantSize + config.elephantXMargin;
  private int _y = config.elephantYMin;
  private int _lastMove = 0;

  Elephant() {
    _svgR = loadShape("Elephant-R.svg");
    _svgL = loadShape("Elephant-L.svg");
  }

  void draw() {
    PShape svg;
    if (_previousDirection == PT_LEFT) {
      svg = cleanShape(_svgL, config.elephantStrokeColor, config.elephantScaleFactor);
    } else {
      svg = cleanShape(_svgR, config.elephantStrokeColor, config.elephantScaleFactor);
    }
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
    _x = max(_x - ceil(getSpeed(PT_LEFT)), config.elephantXMargin);
    _previousDirection = PT_LEFT;
  }

  void moveRight() {
    _x = min(_x + ceil(getSpeed(PT_RIGHT)), width - config.elephantXMargin);
    _previousDirection = PT_RIGHT;
  }

  void moveUp() {
    _y = max(_y - ceil(getSpeed(PT_UP)), config.elephantYMin);
    _previousDirection = PT_UP;
  }

  void moveDown() {
    _y = min(_y + ceil(getSpeed(PT_DOWN)), config.elephantYMax);
    _previousDirection = PT_DOWN;
  }

  void poop(PoopSet p1) {
    int x = _x + config.poopXStartOffset;
    int y = _y;

    if (_previousDirection == PT_LEFT) {
      x = _x + config.elephantSize - config.poopXStartOffset;
    }
    p1.add(x, y);
  }
}
