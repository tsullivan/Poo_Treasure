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
  String _name;

  private short _previousDirection = -1;

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

  void moveTo(int x, int y) {
    _x = x;
    _y = y;
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

    if (elephant.getRider().equals(this)) {
      println(_name + " is the rider");
      moveTo(elephant.getRiderX(), elephant.getRiderY());
    } else {
      _y = lB.startY;
      _x = lB.startX;
    }
    shape(svg, _x, _y, lB.lWidth, lB.lHeight);

    if (config.debug) {
      stroke(_strokeColor);
      strokeWeight(1);
      line(width, 0, lB.startX, lB.startY + lB.lHeight);
    }
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
      "shorty"
      );
  };
  HeroSetup getSetup() {
    return new HeroSetup(
      config.shortyStartX, 
      config.shortyStartY, 
      config.shortyWidth, 
      config.shortyHeight, 
      config.shortyScaleFactor
      );
  }
}

class Batman extends Hero {
  Batman() {
    super(
      loadShape("Batman.svg"), 
      loadShape("Batman.svg"), 
      config.batmanWidth, 
      config.batmanHeight, 
      config.batmanScaleFactor, 
      config.batmanStrokeColor, 
      "batman"
      );
  };
  HeroSetup getLB() {
    return new HeroSetup(
      config.batmanStartX, 
      config.batmanStartY, 
      config.batmanWidth, 
      config.batmanHeight, 
      config.batmanScaleFactor
      );
  }
}

class Robin extends Hero {
  Robin() {
    super(
      loadShape("Robin.svg"), 
      loadShape("Robin.svg"), 
      config.robinWidth, 
      config.robinHeight, 
      config.robinScaleFactor, 
      config.robinStrokeColor, 
      "robin"
      );
  };
  HeroSetup getLB() {
    return new HeroSetup(
      config.robinStartX, 
      config.robinStartY, 
      config.robinWidth, 
      config.robinHeight, 
      config.robinScaleFactor
      );
  }
}
