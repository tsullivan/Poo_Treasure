class Poop {
  private int _x;
  private float _y;
  private int _birthTime = 0;
  private float _distance = 0;
  private boolean _isSplatted = false;

  public boolean isDead = false;

  Poop(int tempX, int tempY) {
    _x = tempX;
    _y = tempY + config.poopYStartOffset;
    _birthTime = millis();
  }

  void draw() {
    if (!config.debug) {
      int ageSeconds = millis() - _birthTime;

      if (ageSeconds > config.poopExplodedTime) {
        isDead = true;
        return;
      }
      if (ageSeconds > config.poopExplodingTime) { // blink
        if (flash(millis())) {
          return;
        }
      }
    }

    fill(config.poopColor);
    strokeWeight(0);

    if (_isSplatted) {
      ellipse(_x, _y, config.poopSize * 2, config.poopSize / 2);
    } else {    
      _y = _y + config.poopSpeed + _distance;
      _y = min(_y, config.poopYDistance);
      ellipse(_x, _y, config.poopSize, config.poopSize);

      if (_y < config.poopYDistance) {
        _distance += 1;
        _distance += _distance * config.distanceAccelerator;
      } else {
        _isSplatted = true;
      }
    }
  }
}

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
    if (!config.debug && millis() - _lastPoop < config.poopThrottle) { 
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
