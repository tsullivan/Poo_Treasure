class Hero {

  // TODO void move to x/y method
  // TODO private boolean _isConnected; // to the eleph
int _x;
int _y;
  private PShape _svgL;
  private PShape _svgR;
  int _width;
  int _height;
  float _scaleFactor;
  float _centerXOffset;
  color _strokeColor;

  private short _previousDirection = -1;

  Hero(
    PShape tempSvgL, 
    PShape tempSvgR, 
    int widdth, 
    int heiight, 
    float scaleFactor, 
    float centerXOffset, 
    color strokeColor
    ) {
    _svgL = tempSvgL;
    _svgR = tempSvgR;

    _width = widdth;
    _height = heiight;
    _scaleFactor = scaleFactor;
    _centerXOffset = centerXOffset;
    _strokeColor = strokeColor;
  }
  
  void moveTo(int x, int y) {
    _x = x;
    _y = y;
  }

  void draw() {
    PShape svg;
    if (_previousDirection == PT_LEFT) {
      svg = cleanShape(_svgL, _strokeColor, _scaleFactor);
    } else {
      svg = cleanShape(_svgR, _strokeColor, _scaleFactor);
    }
    shape(svg, _x, _y, _width, _height);
  }
}

Hero getHeroShorty() {  
  int shortyWidth = 133;
  int shortyHeight = 120;
  float shortyScaleFactor = 1.2;
  float shortyCenterXOffset = 1.15;
  color shortyStrokeColor = color(44, 83, 98);

  return new Hero(
    loadShape("Shorty-L.svg"), 
    loadShape("Shorty-R.svg"), 
    shortyWidth, 
    shortyHeight, 
    shortyScaleFactor, 
    shortyCenterXOffset, 
    shortyStrokeColor
    );
}

Hero getHeroBatman() {
  int batmanWidth = 300;
  int batmanHeight = 400;
  float batmanScaleFactor = 1.5;
  float batmanCenterXOffset = 1.15; // OOPs this shouldnt be a hero field
  color batmanColor = color(0);

  return new Hero(
    loadShape("Batman.svg"), 
    loadShape("Batman.svg"), 
    batmanHeight, 
    batmanWidth, 
    batmanScaleFactor, 
    batmanCenterXOffset, 
    batmanColor
    );
}

Hero getHeroRobin() {
  int robinWidth = 300;
  int robinHeight = 400;
  float robinScaleFactor = 1.5;
  float robinCenterXOffset = 1.15; // OOPs this shouldnt be a hero field
  color robinColor = color(0);

  return new Hero(
    loadShape("Robin.svg"), 
    loadShape("Robin.svg"), 
    robinHeight, 
    robinWidth, 
    robinScaleFactor, 
    robinCenterXOffset, 
    robinColor
    );
}
