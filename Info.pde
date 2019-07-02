class Info {
  private boolean _isHid = false;
  
  void hide() {
    _isHid = true;
    config.infoTimeout = 0;
  }
  
  void draw() {
    if (_isHid) {
      return;
    }
    
    int m = millis();
    if (m < config.infoTimeout) {
      if (m > config.infoFlashTime && flash(m)) {
        return;
      }

      fill(0);
      textSize(config.textSize); // Set text size to 32
      text("Poop: Return", 10, height - config.textMargin);
      text("Walk Elephant: Left / Right", 10, height - config.textSize - config.textMargin);
    }
  }
}
