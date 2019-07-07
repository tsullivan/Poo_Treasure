class Hero {
  private int _x = config.shortyXMargin;
  private int _y = config.shortyYMin;
  private PShape _svgL;
  private PShape _svgR;
  private short _previousDirection = -1;

  //private boolean _isConnected; // to the eleph

  Hero(PShape tempSvgL, PShape tempSvgR) {
    _svgL = tempSvgL;
    _svgR = tempSvgR;
  }

  void draw() {
    PShape svg;
    if (_previousDirection == PT_LEFT) {
      svg = cleanShape(_svgL, config.shortyStrokeColor, config.shortyScaleFactor);
    } else {
      svg = cleanShape(_svgR, config.shortyStrokeColor, config.shortyScaleFactor);
    }
    shape(svg, _x, _y, config.shortyWidth, config.shortyHeight);
  }
}

class Shorty extends Hero {
  Shorty() {
    super(loadShape("Shorty-L.svg"), loadShape("Shorty-R.svg"));
  }
}

class Batman extends Hero {
  Batman() {
    super(loadShape("Batman.svg"), loadShape("Batman.svg"));
  }
}

class Robin extends Hero {
  Robin() {
    super(loadShape("Robin.svg"), loadShape("Robin.svg"));
  }
}
