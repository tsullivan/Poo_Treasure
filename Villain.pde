class Villain {
  private float _speed = config.villainSpeed;
  private float _distance = 0;
  private int _x;
  private int _y;
  private PShape _svg;
  private color _strokeColor;  
  private float _scaleFactor;
  private int _width;
  private int _height;
  private float _centerXOffset;
  private boolean _isDead = false;
  private boolean _isStuck = false;

  Villain(PShape tempSvg, color tempStrokeColor, float tempScaleFactor, int tempWidth, int tempHeight, float tempCenterXOffset) {
    _svg = tempSvg;
    _strokeColor = tempStrokeColor;
    _scaleFactor = tempScaleFactor;
    _width = tempWidth;
    _height = tempHeight;
    _centerXOffset = tempCenterXOffset;

    _x = config.villainStartX;
    _y = config.villainStartY;
  }

  int[] getCoordinates() {
    int[] xy = { _x, _y }; 
    return xy;
  }

  boolean checkDraw() {
    return _distance < config.villainEndX;
  }

  void embarkTo(int destX, int destY) {
    int xDelta = destX - _x;
    int yDelta = destY - _y;

    _x = _x + round(xDelta / 10);
    _y = _y + round(yDelta / 10);
  }

  void draw() {
    if (config.debug) {
      stroke(_strokeColor);
      strokeWeight(1);
      line(getCenterX(), _y, 0, height);
    }

    if (!checkDraw()) {
      return;
    }

    if (_isStuck) {
      int[] xy = villains.getTrophyCoords();
      embarkTo(xy[0], xy[1]);
    } else {
      _speed = min(_speed * config.villainAcceleratorX, config.villainMaxSpeed);
      _distance += _speed;
      _x = floor(_x + _speed);
    }

    _svg = cleanShape(_svg, _strokeColor, _scaleFactor);
    shape(_svg, _x, _y, _width, _height);
  }

  int getCenterX() {
    return floor(_x + (_width / 2) * _centerXOffset);
  }

  boolean isHitBy(Poop p) {
    if (_isDead) {
      return false;
    }

    float pMinX = p.getMinX();
    float pMaxX = p.getMaxX();
    float pMaxY = p.getMaxY();

    if (config.debug) {
      stroke(200, 0, 200);
      strokeWeight(1);
      line(p.getCenterX(), pMaxY, getCenterX(), _y - config.poopHitBufferY); // poop to villain line
      line(_x - config.poopHitBufferX, _y - config.poopHitBufferY, _x + _width + config.poopHitBufferX, _y - config.poopHitBufferY); // top line
      line(_x - config.poopHitBufferX, _y - config.poopHitBufferX, _x - config.poopHitBufferX, config.poopStopY); // left edge
      line(_x + _width + config.poopHitBufferX, _y - config.poopHitBufferX, _x + _width + config.poopHitBufferX, config.poopStopY); // right edge
    }

    if (_x - config.poopHitBufferX <= pMinX) { // x1
      if (_x + _width + config.poopHitBufferX >= pMaxX) { // x2
        if ( _y - config.poopHitBufferY <= pMaxY) { // y1 & y2
          return true;
        }
      }
    }
    return false;
  }

  boolean isDead() {
    return _isDead;
  }

  void stickPoop() {
    _isStuck = true;
  }
}
