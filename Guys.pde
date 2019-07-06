class GuySet { //<>//
  private ArrayList<Guy> _guys = new ArrayList<Guy>();
  private int _lastGuy = 0;

  int size() {
    return _guys.size();
  }

  Guy get(int idx) {
    if (idx >= _guys.size()) { // a guy died
      return null;
    }
    return _guys.get(idx);
  }

  void add() {
    // TODO pick aweighted random params
    PShape svg = loadShape("Alex.svg");
    color alexColor = color(config.alexR, config.alexG, config.alexB);
    Guy newGuy = new Guy(svg, alexColor, config.alexScaleFactor, config.alexWidth, config.alexHeight, config.alexCenterXOffset);
    _guys.add(newGuy);
    _lastGuy = millis();
  }

  void draw() {
    int gSize = _guys.size();
    for (int i = 0; i < gSize; i++) {
      Guy gi = get(i);
      if (gi.isDead()) {
        _guys.remove(i); // loop will change the actual size
        i = i - 1;
        gSize = gSize - 1;
      }
      gi.draw();
    }

    if (millis() - _lastGuy > config.guyRate) {
      // check the timelast and add a guy
      add();
    }
  }

  ArrayList<Guy> findHitGuys(Poop p) {
    ArrayList<Guy> gs = new ArrayList<Guy>();
    for (int i = 0; i < _guys.size(); i++) {
      Guy gi = get(i);
      if (gi.isHitBy(p)) {
        gi.stickPoop(p);
        p.stickGuy(gi);
        gs.add(gi);
      };
    }
    return gs;
  }
}
