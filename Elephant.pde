class Elephant {
  private PShape _svgR;
  private PShape _svgL;

  private short _previousDirection = PT_LEFT;
  private int _x = config.elephantSize + config.elephantMinX;
  private int _y = config.elephantMinY;
  private float _speed = config.elephantSpeed;
  private int _lastMove = 0;

  Elephant() {
    _svgR = loadShape("Elephant-R.svg");
    _svgL = loadShape("Elephant-L.svg");
  }

  void draw() {

    if (config.debug) {
      stroke(config.elephantStrokeColor);
      strokeWeight(1);
      line(config.elephantMinX, 0, config.elephantMinX, height);
      line(config.elephantMaxX, 0, config.elephantMaxX, height);
      line(0, config.elephantMinY, width, config.elephantMinY);
      line(0, config.elephantMaxY, width, config.elephantMaxY);
    }

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

    float accelerator;
    float maxSpeed;
    if (direction == PT_UP || direction == PT_DOWN) {
      accelerator = config.elephantYAccelerator;
      maxSpeed = config.elephantMaxYSpeed;
    } else {
      accelerator = config.elephantXAccelerator;
      maxSpeed = config.elephantMaxXSpeed;
    }

    if (slowness < config.elephantAccelerationTimeout && direction == _previousDirection) {
      _speed = 1 + _speed + accelerator;
    } else {
      _speed = config.elephantSpeed;
    }

    return min(maxSpeed, _speed);
  }

  void moveLeft() {
    _x = max(_x - ceil(getSpeed(PT_LEFT)), config.elephantMinX);
    _previousDirection = PT_LEFT;
  }

  void moveRight() {
    _x = min(_x + ceil(getSpeed(PT_RIGHT)), config.elephantMaxX);
    _previousDirection = PT_RIGHT;
  }

  void moveUp() {
    _y = max(_y - ceil(getSpeed(PT_UP)), config.elephantMinY);
    _previousDirection = PT_UP;
  }

  void moveDown() {
    _y = min(_y + ceil(getSpeed(PT_DOWN)), config.elephantMaxY);
    _previousDirection = PT_DOWN;
  }

  void poop(PoopSet p1) {
    int x;
    int y = _y;

    if (_previousDirection == PT_LEFT) {
      x = _x + config.elephantSize - config.poopStartOffsetX;
    } else {
      x = _x + config.poopStartOffsetX;
    }

    p1.add(x, y);
  }
}
