class Shorty {
  private int _x = config.shortyXMargin;
  private int _y = config.shortyYMin;
  private PShape svg;
  private boolean _isConnected; // to the eleph


  Shorty() {
    svg = loadShape("Shorty.svg");
  }

  void draw() {
    shape(svg, _x, _y, config.shortySize, config.shortySize);
  }
}
