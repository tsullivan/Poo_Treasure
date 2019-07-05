class Shorty {
  private int _x = config.shortyXMargin;
  private int _y = config.shortyYMin;
  private PShape _svgL;
  private PShape _svgR;
  private short _previousDirection = -1;

  //private boolean _isConnected; // to the eleph


  Shorty() {
    _svgL = loadShape("Shorty-L.svg");
    _svgR = loadShape("Shorty-R.svg");
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
