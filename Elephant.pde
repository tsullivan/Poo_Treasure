class Elephant {
  private ElephantGraphic _graphic;

  private int _x = config.elephantSize + config.elephantMinX;
  private int _y = height / 2;
  private float _speed = config.elephantSpeed;
  private int _lastMove = 0;

  private Hero _rider;
  private int _riderStartMillis;
  private int _riderTurnMillis;

  public short previousDirection = PT_LEFT;

  Elephant() {
    _rider = null;
    _riderTurnMillis = 0;

    _graphic = new ElephantGraphic();
  }

  float getSpeed(short direction) {
    float accelerator;
    float maxSpeed;

    if (direction == PT_UP || direction == PT_DOWN) {
      accelerator = config.elephantYAccelerator;
      maxSpeed = config.elephantMaxYSpeed;
    } else {
      accelerator = config.elephantXAccelerator;
      maxSpeed = config.elephantMaxXSpeed;
    }

    int slowness = millis() - _lastMove;
    if (slowness < config.elephantAccelerationTimeout && direction == previousDirection) {
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
    previousDirection = PT_LEFT;
    _lastMove = millis();
  }

  void moveRight() {
    int destX = min(_x + ceil(getSpeed(PT_RIGHT)), config.elephantMaxX); 
    int[] xy = walkFn(destX, _y);
    _x = xy[0];
    _y = xy[1];

    previousDirection = PT_RIGHT;
    _lastMove = millis();
  }

  void moveUp() {
    int destY = max(_y - ceil(getSpeed(PT_UP)), config.elephantMinY); 
    int[] xy = walkFn(_x, destY);
    _x = xy[0];
    _y = xy[1];

    _lastMove = millis();
    previousDirection = PT_UP;
  }

  void moveDown() {
    int destY = min(_y + ceil(getSpeed(PT_DOWN)), config.elephantMaxY); 
    int[] xy = walkFn(_x, destY);
    _x = xy[0];
    _y = xy[1];

    _lastMove = millis();
    previousDirection = PT_DOWN;
  }

  void poop(PoopSet p1) {
    int x;
    int y = _y;

    if (previousDirection == PT_LEFT) {
      x = _x + config.elephantSize - config.poopStartOffsetX;
    } else {
      x = _x + config.poopStartOffsetX;
    }

    p1.add(x, y);
  }

  int getX() {
    return _x;
  }
  int getY() {
    return _y;
  }

  int getRiderX() {
    if (previousDirection == PT_LEFT) {
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

  void draw() {
    _graphic.draw();
  }
}

class ElephantGraphic {
  int _x;
  int _y;

  void embarkTo(int destX, int destY) {
    int xDelta = destX - _x;
    int yDelta = destY - _y;

    _x = _x + round(xDelta / config.elephantEmbarkSpeed);
    _y = _y + round(yDelta / config.elephantEmbarkSpeed);
  }

  void draw() {
    PShape svgR = loadShape("Elephant-R.svg");
    PShape svgL = loadShape("Elephant-L.svg");
    PShape svg;
    if (elephant.previousDirection == PT_LEFT) {
      svg = cleanShape(svgL, config.elephantStrokeColor, config.elephantScaleFactor);
    } else {
      svg = cleanShape(svgR, config.elephantStrokeColor, config.elephantScaleFactor);
    }

    embarkTo(elephant.getX(), elephant.getY());

    shape(svg, _x, _y, config.elephantSize, config.elephantSize);
  }
}
