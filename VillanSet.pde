class VillainSet {
  private ArrayList<Villain> _villains = new ArrayList<Villain>();
  private int _lastVillain = 0;

  int size() {
    return _villains.size();
  }

  Villain get(int idx) {
    if (idx >= _villains.size()) { // a villain died
      return null;
    }
    return _villains.get(idx);
  }

  void add() {
   Villain alex = getVillainAlex();
   _villains.add(alex);
   _lastVillain = millis();
  }

  void draw() {
    int vSize = _villains.size();
    for (int i = 0; i < vSize; i++) {
      Villain gi = get(i);
      if (gi.isDead()) {
        _villains.remove(i); // loop will change the actual size
        i = i - 1;
        vSize = vSize - 1;
      }
      gi.draw();
    }

    if (millis() - _lastVillain > config.villainRate) {
      // check the timelast and add a villain
      add();
    }
  }

  ArrayList<Villain> findHitGuys(Poop p) {
    ArrayList<Villain> vs = new ArrayList<Villain>();
    for (int i = 0; i < _villains.size(); i++) {
      Villain vi = get(i);
      if (vi.isHitBy(p)) {
        vi.stickPoop();
        p.stickGuy(vi);
        vs.add(vi);
      };
    }
    return vs;
  }
}
