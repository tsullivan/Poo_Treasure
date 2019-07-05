


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

  boolean isSplatted() {
    return _isSplatted;
  }

  int getCenterX() {
    return _x;
  }

  float getY() {
    return _y;
  }
}
