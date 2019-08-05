class Elephant {
  private PShape _svgR;
  private PShape _svgL;

  private short _previousDirection = PT_LEFT;
  private int _x = config.elephantSize + config.elephantMinX;
  private int _y = config.elephantMinY;
  private float _speed = config.elephantSpeed;
  private int _lastMove = 0;

  private Hero _rider;
  private int _riderStartMillis;
  private int _riderTurnMillis;

  Elephant() {
    _svgR = loadShape("Elephant-R.svg");
    _svgL = loadShape("Elephant-L.svg");

    _rider = null;
    _riderTurnMillis = 0;
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

  int[] walkFn(int destX, int destY) {
    int[] xy = { destX, destY };
    return xy;
  }

  void moveLeft() {
    int destX = max(_x - ceil(getSpeed(PT_LEFT)), config.elephantMinX); 
    int[] xy = walkFn(destX, _y);
    _x = xy[0];
    _y = xy[1];
    _previousDirection = PT_LEFT;
  }

  void moveRight() {
    int destX = min(_x + ceil(getSpeed(PT_RIGHT)), config.elephantMaxX); 
    int[] xy = walkFn(destX, _y);
    _x = xy[0];
    _y = xy[1];

    _previousDirection = PT_RIGHT;
  }

  void moveUp() {
    int destY = max(_y - ceil(getSpeed(PT_UP)), config.elephantMinY); 
    int[] xy = walkFn(_x, destY);
    _x = xy[0];
    _y = xy[1];

    _previousDirection = PT_UP;
  }

  void moveDown() {
    int destY = min(_y + ceil(getSpeed(PT_DOWN)), config.elephantMaxY); 
    int[] xy = walkFn(_x, destY);
    _x = xy[0];
    _y = xy[1];

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

  int getRiderX() {
    if (_previousDirection == PT_LEFT) {
      return _x + config.elephantSize / 2 - config.poopStartOffsetX;
    }
    return _x + config.poopStartOffsetX * 2;
  }
  int getRiderY() {
    return _y - 80;
  }

  void setRider(Hero h) {
    _riderStartMillis = millis();
    this._rider = h;
  }

  Hero getRider() {
    return this._rider;
  }

  boolean isReadyToRide() {
    _riderTurnMillis = millis() - _riderStartMillis;
    return _riderTurnMillis > 1100;
  }
}
