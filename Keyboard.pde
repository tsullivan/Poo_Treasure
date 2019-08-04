class Keyboard {
  void checkKey() {
    if (key == ' ') {
      elephant.poop(poops);
    }
    
    switch (keyCode) {
    case LEFT:
      elephant.moveLeft();
      return;
    case RIGHT:
      elephant.moveRight();
      return;
    case UP:
      elephant.moveUp();
      return;
    case DOWN:
      elephant.moveDown();
      return;
    case ENTER:
      elephant.poop(poops);
      return;
    }      

    if (key == '?') { // toggle debug
      config.debug = !config.debug;
      println("Debug: " + config.debug);
    }

    if (config.debug) {
      DebugKeyMap dbg = config.getDebugKeyMap();
      dbg.checkDebug(key);
    }
  }
}
