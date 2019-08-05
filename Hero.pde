class HeroDefinition {
  int startX;
  int startY;
  int hWidth;
  int hHeight;
  float scaleFactor;

  HeroDefinition(int tX, int tY, int tW, int tH, float sF) {
    startX = tX;
    startY = tY;
    hWidth = tW;
    hHeight = tH;
    scaleFactor = sF;
  }
}

class Hero {
  HeroDefinition _heroDef;

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
    HeroDefinition lb, 
    PShape tempSvgL, 
    PShape tempSvgR, 
    int widdth, 
    int heiight, 
    float scaleFactor, 
    color strokeColor, 
    String name
    ) {
    _heroDef = lb;
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

  void draw() {
    PShape svg;
    float scaleFactor = _heroDef.scaleFactor;
    int startX = _heroDef.startX;
    int startY = _heroDef.startY;
    int lWidth = _heroDef.hWidth;
    int lHeight = _heroDef.hHeight;

    if (_previousDirection == PT_LEFT) {
      svg = cleanShape(_svgL, _strokeColor, scaleFactor);
    } else {
      svg = cleanShape(_svgR, _strokeColor, scaleFactor);
    }

    if (elephant.isReadyToRide() && elephant.getRider().equals(this)) {
      embarkTo(elephant.getRiderX(), elephant.getRiderY());
    } else {
      embarkTo(startX, startY);
    }
    shape(svg, _x, _y, lWidth, lHeight);

    if (config.debug) {
      stroke(_strokeColor);
      strokeWeight(1);
      line(width, 0, startX, startY + lHeight);
    }
  }

  void setNextHero(Hero h) {
    _nextHero = h;
  }

  Hero getNextHero() {
    return _nextHero;
  }
}
