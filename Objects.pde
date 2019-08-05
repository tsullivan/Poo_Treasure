/*
 * Heroes
 */

Hero getHeroShorty() {
  class Shorty extends Hero {
    Shorty() {
      super(
        new HeroDefinition(
        config.shortyStartX, 
        config.shortyStartY, 
        config.shortyWidth, 
        config.shortyHeight, 
        config.shortyScaleFactor
        ), 
        loadShape("Shorty-L.svg"), 
        loadShape("Shorty-R.svg"), 
        config.shortyWidth, 
        config.shortyHeight, 
        config.shortyScaleFactor, 
        config.shortyStrokeColor, 
        "shorty"
        );
    };
  }
  return new Shorty();
}

Hero getHeroBatman() {
  class Batman extends Hero {
    Batman() {
      super(
        new HeroDefinition(
        config.batmanStartX, 
        config.batmanStartY, 
        config.batmanWidth, 
        config.batmanHeight, 
        config.batmanScaleFactor
        ), 
        loadShape("Batman.svg"), 
        loadShape("Batman.svg"), 
        config.batmanWidth, 
        config.batmanHeight, 
        config.batmanScaleFactor, 
        config.batmanStrokeColor, 
        "batman"
        );
    }
  }  
  return new Batman();
}

Hero getHeroRobin() {
  class Robin extends Hero {
    Robin() {
      super(new HeroDefinition(
        config.robinStartX, 
        config.robinStartY, 
        config.robinWidth, 
        config.robinHeight, 
        config.robinScaleFactor
        ), 
        loadShape("Robin.svg"), 
        loadShape("Robin.svg"), 
        config.robinWidth, 
        config.robinHeight, 
        config.robinScaleFactor, 
        config.robinStrokeColor, 
        "robin"
        );
    };
  }  
  return new Robin();
}

/*
 * Villains
 */
 
Villain getVillainAlex() {  
  int alexWidth = 133;
  int alexHeight = 120;
  float alexScaleFactor = 1.2;
  float alexCenterXOffset = 1.15;
  color alexStrokeColor = color(44, 83, 98);

  return new Villain(
    loadShape("Alex.svg"), 
    alexStrokeColor, 
    alexScaleFactor, 
    alexWidth, 
    alexHeight, 
    alexCenterXOffset
    );
}
