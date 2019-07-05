class Poop {
  private int _x;
  private float _y;
  private int _birthTime = 0;
  private float _distance = 0;
  private boolean _isSplatted = false;

  private boolean _isDead = false;
  private boolean _isStuck = false;

  private Guy _stuckGuy;

  Poop(int tempX, int tempY) {
    _x = tempX;
    _y = tempY + config.poopYStartOffset;
    _birthTime = millis();
  }

  void draw() {
    if (!config.debug) {
      int ageSeconds = millis() - _birthTime;

      if (ageSeconds > config.poopExplodedTime) {
        _isDead = true;
        return;
      }

      if (!_isStuck && ageSeconds > config.poopExplodingTime) { // blink
        if (flash(millis())) {
          return;
        }
      }
    }

    fill(config.poopColor);
    strokeWeight(0);

    if (_isStuck) {
      ellipse(_stuckGuy.getCenterX(), _stuckGuy.getY(), config.poopSize * 2, config.poopSize / 2);
      return;
    }
    if (_isSplatted) {
      ellipse(_x, _y, config.poopSize * 2, config.poopSize / 2);
      return;
    } 
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

  boolean isSplatted() {
    return _isSplatted;
  }

  boolean isStuck() {
    return _isStuck;
  }

  boolean isDead() {
    return _isDead;
  }

  int getCenterX() {
    return floor(_x + (config.poopSize / 2));
  }

  float getMinX() {
    return _x;
  }

  float getMaxX() {
    return _x + config.poopSize;
  }

  float getMinY() {
    return _y;
  }

  float getMaxY() {
    return _y + config.poopSize;
  }

  void stickGuy(Guy g) {
    _isStuck = true;
    _stuckGuy = g;
  }
}
