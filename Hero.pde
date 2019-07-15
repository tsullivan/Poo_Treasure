class Hero { //<>//

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
    color strokeColor
    ) {
    _svgL = tempSvgL;
    _svgR = tempSvgR;

    _width = widdth;
    _height = heiight;
    _scaleFactor = scaleFactor;
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

class LifeBall {
  int startX;
  int startY;
  int scaleFactor;
  LifeBall(int tX, int tY, float sF) {
    startX = tX;
    startY = tY;
    scaleFactor = sF;
  }
}

class Shorty extends Hero {
  Shorty() {
   

  super(
    loadShape("Shorty-L.svg"), 
    loadShape("Shorty-R.svg"), 
    config.shortyWidth, 
    config.shortyHeight, 
    config.shortyScaleFactor,
    config.shortyStrokeColor,

    );
  };
  LifeBall getLB() {
    return new LifeBall(
      config.shortyStartX, 
      config.shortyStartY, 
      config.shortyScaleFactor, 
      );
  }
}

class Batman extends Hero {
  float getLife() {
    return config.shortyScaleFactor;
  }
}

class Robin extends Hero {
  float getSF() {
    return config.shortyScaleFactor;
  }
}

Hero getHeroShorty() {  
  
}

Hero getHeroBatman() {
  int batmanWidth = 300;
  int batmanHeight = 400;
  float batmanScaleFactor = config.batmanScaleFactor;
  float batmanCenterXOffset = 1.15; // OOPs this shouldnt be a hero field
  color batmanColor = color(0);

  return new Hero(
    loadShape("Batman.svg"), 
    loadShape("Batman.svg"), 
    batmanHeight, 
    batmanWidth, 
    batmanScaleFactor, 
    batmanColor
    );
}

Hero getHeroRobin() {
  int robinWidth = 300;
  int robinHeight = 400;
  float robinScaleFactor = config.robinScaleFactor;
  float robinCenterXOffset = 1.15; // OOPs this shouldnt be a hero field
  color robinColor = color(0);

  return new Hero(
    loadShape("Robin.svg"), 
    loadShape("Robin.svg"), 
    robinHeight, 
    robinWidth, 
    robinScaleFactor, 
    robinColor
    );
}
