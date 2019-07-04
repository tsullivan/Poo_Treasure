class Guy {
  private int _x = config.shortyXMargin + 200;
  private int _y = config.shortyYMin;
  private PShape _svg;
  private float _scaleFactor = 1.0;
  private float _size;
  private boolean _isConnected = false; // to poop

  public boolean isDead;

  Guy(PShape tempSvg, float tempScaleFactor, float tempSize) {
    _svg = tempSvg;
    _scaleFactor = tempScaleFactor;
    _size = tempSize;
  }

  void draw() {
    _x = _x + 1;
    shape(_svg, _x, _y, _size, _size);
  }
}

class GuySet {
  private ArrayList<Guy> _guys = new ArrayList<Guy>();
  private int _lastGuy = 0;

  int size() {
    return _guys.size();
  }

  Guy get(int idx) {
    return _guys.get(idx);
  }

  void add(int x, int y) {
    PShape svg = loadShape("Alex.svg");
    Guy newGuy = new Guy(svg, 1, 100);
    _guys.add(newGuy);
    _lastGuy = millis();
  }

  void draw() {
    if (_guys.size() <= 0 && millis() - _lastGuy > 2000) {
      // check the timelast and add a guy
      add(10, 10);
    }

    for (int i = 0; i < _guys.size(); i++) { //<>//
      Guy pi = get(i);
      if (pi.isDead) {
        _guys.remove(i);
      } else {
        pi.draw();
      }
    }
  }
}
