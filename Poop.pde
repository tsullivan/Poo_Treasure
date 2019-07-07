class Poop {
  private int _x;
  private float _y;
  private int _birthTime = 0;
  private float _distance = 0;
  private boolean _isSplatted = false;

  private boolean _isDead = false;
  private boolean _isStuck = false;
  private float _stuckDeltaX;
  private float _stuckDeltaY;
  private Villain _stuckGuy;

  Poop(int tempX, int tempY) {
    _x = tempX;
    _y = tempY + config.poopStartOffsetY;
    _birthTime = millis();
  }

  boolean checkDraw() {
    if (_isStuck) {
      return true;
    }
    
    int ageSeconds = millis() - _birthTime;
    
    // garbage collection
    if (ageSeconds > config.poopExplodedTime) {
      _isDead = true;
      return false;
    }
    
    // blink
    if (ageSeconds > config.poopExplodingTime && flash(millis())) {
      return false;
    }

    return true;
  }

  void draw() {
    if (!checkDraw() && !config.debug) {
      return;
    }

    fill(config.poopColor);
    stroke(config.poopColor);
    strokeWeight(10);

    if (_isStuck) {
      ellipse(_stuckGuy.getCenterX() + _stuckDeltaX, _stuckGuy.getY() + _stuckDeltaY, config.poopSize * 2, config.poopSize / 2);
      return;
    }
    if (_isSplatted) {
      ellipse(_x, _y, config.poopSize * 2, config.poopSize / 2);
      return;
    }

    _y = _y + config.poopSpeed + _distance;
    _y = min(_y, config.poopStopY);
    ellipse(_x, _y, config.poopSize, config.poopSize);

    if (_y < config.poopStopY) {
      _distance += 1 + _distance * config.poopYAccelerator;
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

  void stickGuy(Villain g) {
    _isStuck = true;
    _stuckGuy = g;
    _stuckDeltaX = _x - g.getCenterX();
    _stuckDeltaY = _y - g.getY();
  }
}
