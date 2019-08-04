class Hero {

  int _x;
  int _y;
  private PShape _svgL;
  private PShape _svgR;
  int _width;
  int _height;
  float _scaleFactor;
  float _centerXOffset;
  color _strokeColor;
  String _name;

  private short _previousDirection = -1;

  Hero _nextHero = null;
  
  Hero(
    PShape tempSvgL, 
    PShape tempSvgR, 
    int widdth, 
    int heiight, 
    float scaleFactor, 
    color strokeColor, 
    String name
    ) {
    _svgL = tempSvgL;
    _svgR = tempSvgR;

    _width = widdth;
    _height = heiight;
    _scaleFactor = scaleFactor;
    _strokeColor = strokeColor;
    _name = name;
  }

  void embarkTo(int destX, int destY) {
    int xDelta = destX - _x;
    int yDelta = destY - _y;
    
    _x = _x + round(xDelta / config.heroEmbarkSpeed);
    _y = _y + round(yDelta / config.heroEmbarkSpeed);
  }

  HeroSetup getLB() {
    return new HeroSetup(
      config.shortyStartX, 
      config.shortyStartY, 
      config.shortyWidth, 
      config.shortyHeight, 
      config.shortyScaleFactor
      );
  }

  void draw() {
    PShape svg;
    HeroSetup lB = this.getLB();

    if (_previousDirection == PT_LEFT) {
      svg = cleanShape(_svgL, _strokeColor, lB.scaleFactor);
    } else {
      svg = cleanShape(_svgR, _strokeColor, lB.scaleFactor);
    }

    if (elephant.isReadyToRide() && elephant.getRider().equals(this)) {
      embarkTo(elephant.getRiderX(), elephant.getRiderY());
    } else {
      embarkTo(lB.startX, lB.startY);
    }
    shape(svg, _x, _y, lB.lWidth, lB.lHeight);

    if (config.debug) {
      stroke(_strokeColor);
      strokeWeight(1);
      line(width, 0, lB.startX, lB.startY + lB.lHeight);
    }
  }
  
  void setNextHero(Hero h) {
    _nextHero = h;
  }
  
  Hero getNextHero() {
    return _nextHero;
  }
}
