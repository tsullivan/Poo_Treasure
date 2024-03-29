class Info {
  private boolean _isHid = false;
  private ArrayList<String> _texts = new ArrayList<String>();

  Info() {
    String[] infos = {
      "Walk Elephant: Left / Right", 
      "Poop: Return", 
      "Switch Hero: s", 
    };
    
    for (int i = infos.length - 1; i >= 0; i--) {
      this.addText(infos[i]);
    }
  }

  void hide() {
    _isHid = true;
    config.infoTimeout = 0;
  }

  void addText(String s) {
    _texts.add(s);
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

      for (int i = _texts.size() - 1; i >= 0; i--) {
        String s = _texts.get(i);
        text(s, 10, height - (config.textMargin * (i + 1)) - (config.textSize * i));
      }
    }
  }
}
