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

  /* TODO
   * only check if the guy closest to the poop has been hit by the poop
   */
  ArrayList<Villain> findHitGuys(Poop p) {
    ArrayList<Villain> vs = new ArrayList<Villain>();
    for (int i = 0; i < _villains.size(); i++) {
      Villain villain = get(i);
      // int[] xy = villain.getCoordinates(); // use this to find the guy with the shortest distance 
      if (villain.isHitBy(p)) {
        villain.stickPoop();
        p.stickGuy(villain);
        vs.add(villain);

        _hitVillains.put(villain.toString(), villain);
      };
    }
    return vs;
  }
}
