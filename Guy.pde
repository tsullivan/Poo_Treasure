class Guy {
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
  private boolean _isRetired = false;

  Guy(PShape tempSvg, color tempStrokeColor, float tempScaleFactor, int tempWidth, int tempHeight, float tempCenterXOffset) {
    _svg = tempSvg;
    _strokeColor = tempStrokeColor;
    _scaleFactor = tempScaleFactor;
    _width = tempWidth;
    _height = tempHeight;
    _centerXOffset = tempCenterXOffset;

    _x = config.guyStartX;
    _y = config.guyStartY;
  }

  boolean checkDraw() {
    if (_distance > config.guyEndX) {
      if (_isStuck && !_isRetired) {
        _isRetired = true;
        _y = config.retiredStartX;
        _x = config.retiredStartY;
      } else {
        _isDead = true;
        return false;
      }
    }
    return true;
  }

  void draw() {
    if (config.debug) {
      stroke(_strokeColor);
      strokeWeight(1);
      line(getCenterX(), _y, 0, height);
    }

    if (!checkDraw()) {
      //return;
    }

    if (_isRetired) {
      _x = floor(_x - config.guySpeed);
    } else {
      _distance += config.guySpeed;
      _x = floor(_x + config.guySpeed);
    }

    _svg = cleanShape(_svg, _strokeColor, _scaleFactor);
    shape(_svg, _x, _y, _width, _height);
  }

  int getCenterX() {
    return floor(_x + (_width / 2) * _centerXOffset);
  }

  int getY() {
    return _y;
  }

  boolean isHitBy(Poop p) {
    if (_isDead || _isRetired) {
      return false;
    }

    float pMinX = p.getMinX();
    float pMaxX = p.getMaxX();
    float pMaxY = p.getMaxY();

    if (config.debug) {
      stroke(200, 0, 200);
      strokeWeight(1);
      line(p.getCenterX(), pMaxY, getCenterX(), _y - config.poopHitBuffer); // poop to guy line
      line(_x - config.poopHitBuffer, _y - config.poopHitBuffer, _x + _width + config.poopHitBuffer, _y - config.poopHitBuffer); // top line
      line(_x - config.poopHitBuffer, _y - config.poopHitBuffer, _x - config.poopHitBuffer, config.poopStopY); // left edge
      line(_x + _width + config.poopHitBuffer, _y - config.poopHitBuffer, _x + _width + config.poopHitBuffer, config.poopStopY); // right edge
    }

    if (_x - config.poopHitBuffer <= pMinX) { // x1
      if (_x + _width + config.poopHitBuffer >= pMaxX) { // x2
        if ( _y - config.poopHitBuffer <= pMaxY) { // y1 & y2
          return true;
        }
      }
    }
    return false;
  }

  boolean isDead() {
    return _isDead;
  }

  void stickPoop(Poop p) {
    _isStuck = true;
  }
}
