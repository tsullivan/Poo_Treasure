class Keyboard {
  void keyPressed() {
    info.hide();

    if (keyCode == LEFT) {
      elephant.moveLeft();
    } else if (keyCode == RIGHT) {
      elephant.moveRight();
    } else if (keyCode == ENTER) {
      elephant.poop(poops);
    } else if (key == '?') { // toggle debug
      config.debug = !config.debug;
      println("Debug: " + config.debug);
    } else if (config.debug) { // test debug
      config.useDebugKey(keyCode);
    }
  }
}
