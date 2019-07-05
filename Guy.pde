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

  Guy(PShape tempSvg, int tempX, int tempY, color tempStrokeColor, float tempScaleFactor, int tempWidth, int tempHeight, float tempCenterXOffset) {
    _svg = tempSvg;
    _strokeColor = tempStrokeColor;
    _scaleFactor = tempScaleFactor;
    _x = tempX;
    _y = tempY;
    _width = tempWidth;
    _height = tempHeight;
    _centerXOffset = tempCenterXOffset;
  }

  void draw() {
    if (_distance > config.guyEndX) {
      _isDead = true;
      return;
    }

    _distance += config.guySpeed;
    _x = floor(_x + config.guySpeed);
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
    float pMinX = p.getMinX();
    float pMaxX = p.getMaxX();
    float pMaxY = p.getMaxY();
    
    if (config.debug) {
      float pCenterX = p.getCenterX();
      stroke(200, 200, 0);
      strokeWeight(3);
      line(pCenterX, pMaxY, getCenterX(), _y - config.poopHitBuffer);
      line(pMinX, pMaxY, pMaxX, pMaxY);
      line(_x - config.poopHitBuffer,  _y - config.poopHitBuffer, _x + _width + (config.poopHitBuffer * 2),  _y - config.poopHitBuffer);
    }
    
    if (_x - config.poopHitBuffer <= pMinX) { // x1
      if (_x + _width + (config.poopHitBuffer * 2) >= pMaxX) { // x2
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
    /* make the person have a sad face on */
    /* make them walk to the defeat box */
  }
}
