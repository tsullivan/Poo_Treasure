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
  private boolean _isGone = false;
  private boolean _isStuck = false;
  private boolean _isCollected = false;

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

  boolean ranAway() {
    if (_distance >= config.villainEndX) {
      _isGone = true;
    }
    return _isGone;
  }

  void embarkTo(int destX, int destY) {
    int xDelta = destX - _x;
    int yDelta = destY - _y;

    _x = _x + round(xDelta / 10);
    _y = _y + round(yDelta / 10);
  }

  void draw() {
    if (_isGone || ranAway()) {
      return;
    }

    if (config.debug) {
      stroke(_strokeColor);
      strokeWeight(1);
      line(getCenterX(), _y, width / 2, height);
    }

    // move them around
    if (!_isCollected) {    
      if (_isStuck) {
        int[] xy = villains.getTrophyCoords();
        int trophyX = xy[0];
        
        // find the distance and mark as collected if they walked far enough by now
        if (abs(trophyX - _x) < 18) {
          _isCollected = true;
        }
        embarkTo(trophyX, xy[1]);
      } else {
        _speed = min(_speed * config.villainAcceleratorX, config.villainMaxSpeed);
        _distance += _speed;
        _x = floor(_x + _speed);
      }
    }

    _svg = cleanShape(_svg, _strokeColor, _scaleFactor);
    shape(_svg, _x, _y, _width, _height);
  }

  int getCenterX() {
    return floor(_x + (_width / 2) * _centerXOffset);
  }

  boolean isHitBy(Poop p) {
    if (_isGone || _isCollected) {
      return false;
    }

    float pMinX = p.getMinX();
    float pMaxX = p.getMaxX();
    float pMaxY = p.getMaxY();

    if (_x - config.poopHitBufferX <= pMinX) { // x1
      if (_x + _width + config.poopHitBufferX >= pMaxX) { // x2
        if ( _y - config.poopHitBufferY <= pMaxY) { // y1 & y2
          return true;
        }
      }
    }
    return false;
  }

  boolean isGone() {
    return _isGone;
  }

  void stickPoop() {
    _isStuck = true;
  }
}
