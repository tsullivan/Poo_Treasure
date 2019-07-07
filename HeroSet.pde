class HeroSet {
  private ArrayList<Hero> _heroes = new ArrayList<Hero>();
  
  HeroSet() {
    _heroes.add(new Shorty());
    _heroes.add(new Batman());
    _heroes.add(new Robin());
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
