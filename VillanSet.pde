class VillainSet {
  private ArrayList<Villain> _villains = new ArrayList<Villain>();
  private HashMap<String, Villain> _hitVillains = new HashMap<String, Villain>();

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

  int[] getTrophyCoords() {
    int[] xy = {
      config.villainTrophyBoxX, 
      max(20, config.villainTrophyBoxY - (_hitVillains.size() * 20)), 
    };
    return xy;
  }

  void draw() {
    int vSize = _villains.size();
    for (int i = 0; i < vSize; i++) {
      Villain gi = get(i);
      if (gi.isGone()) {
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

  void hitAVillain(Poop p) {
    int[] xyPoop = p.getCoordinates();
    // find shortest distance villain
    int minX = width;
    Villain closestVillain = null;
    for (int i = 0; i < _villains.size(); i++) {
      Villain villain = get(i);
      int[] xyVillain = villain.getCoordinates();
      if (abs(xyVillain[0] - xyPoop[0]) < minX) {
        minX = abs(xyVillain[0] - xyPoop[0]);
        closestVillain = villain;
      }
    }
    
    if (closestVillain == null) {
      return;
    }

    if (closestVillain.isHitBy(p)) {
      closestVillain.stickPoop();
      p.stickGuy(closestVillain);

      _hitVillains.put(closestVillain.toString(), closestVillain);
    }
  }
}
