class HeroSet {
  private ArrayList<Hero> _heroes = new ArrayList<Hero>();
  
  HeroSet() {
    Hero shorty = new Shorty();
    Hero batman = new Batman();
    Hero robin = new Robin();
    
    shorty.moveTo(config.shortyStartX, config.shortyStartY);
    batman.moveTo(config.batmanStartX, config.batmanStartY);
    robin.moveTo(config.robinStartX, config.robinStartY);
    
    _heroes.add(shorty);
    _heroes.add(batman);
    _heroes.add(robin);
  }

  int size() {
    return _heroes.size();
  }
  
  Hero get(int i) {
    return _heroes.get(i);
  }

  void draw() {
    for (int i = 0; i < _heroes.size(); i++) {
      Hero hi = get(i);
      hi.draw();
    }
  }
}
