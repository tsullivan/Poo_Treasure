class PoopSet {
  private ArrayList<Poop> _poops = new ArrayList<Poop>();
  private int _lastPoop = 0;

  int size() {
    return _poops.size();
  }

  Poop get(int idx) {
    return _poops.get(idx);
  }

  void add(int x, int y) {
    if (millis() - _lastPoop < config.poopThrottle) { 
      return; // throttle the poops
    }

    _poops.add(new Poop(x, y));
    _lastPoop = millis();
  }

  void draw() {
    for (int i = 0; i < _poops.size(); i++) {
      Poop pi = get(i);
      if (pi.isDead) {
        _poops.remove(i);
      } else {
        pi.draw();
      }
    }
  }
}
