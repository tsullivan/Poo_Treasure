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
  public boolean isDead = false;

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
      isDead = true;
      return;
    }

    _distance += config.guySpeed;
    _x = floor(_x + config.guySpeed);
    _svg = cleanShape(_svg, _strokeColor, _scaleFactor);
    shape(_svg, _x, _y, _width, _height);
    
    if (config.debug) {
      rect(_x, _y, _width, _height);
    }
  }

  int getCenterX() {
    return floor(_x + (_width / 2) * _centerXOffset);
  }

  int getY() {
    return _y;
  }

  boolean isHitBy(Poop p) {
    if (config.debug) {
      line(this.getCenterX(), _y, p.getCenterX(), p.getY());
    }
    int xDelta = p.getCenterX() - _x;
    return abs(xDelta) <= 20 && p.getY() >= _y;
  }

  void stickPoop(Poop p) {
    println("got it stuck!");
    println(this);
    println(p);
  }
}
