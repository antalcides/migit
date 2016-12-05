public enum EnemyType {
  KRONOS, GOBLIN, SLIME, PHOENIX, INTRO1, INTRO2; 
}

public class InfoState extends GameState {
  
  private EnemyType type;
  private Sprite sprite;
  private String[] info;
  private PFont font;
  
  private int xLoc, yLoc;
  
  public InfoState(GameStateManager gsm, EnemyType type) {
    super(gsm);
    this.type = type;
    
    xLoc = 130;
    yLoc = 385;
    
    if(type == EnemyType.KRONOS) {
      sprite = new Sprite("Kronos_Scroll.png");
      info = new String[]{"Once revered as the greatest warrior in the empire, the ex generals boasts", "vitality, attack damage and speed. Hell bent on revenge and a warrior", "to the heart, the ex general will destroy anything that", "stands in his way, including your defenses."};
    }
    else if(type == EnemyType.GOBLIN) {
      sprite = new Sprite("Goblins_Scroll.png");
      info = new String[]{"Typically found in mountain caves, goblins are savage creatures capable of", "rivaling most intermediate level soldiers. Although once an enemy of the general,", "Goblins can be easily bought with their love for precious metals.", "Goblins are fairly balanced in health, speed, and numbers."};
    }
    else if(type == EnemyType.SLIME) {
      sprite = new Sprite("Slimes_Scroll.png");
      info = new String[]{"Individual slimes are weak and slow creatures and are typically not a big deal.", "However they are rarely found alone and turn their excess numbers into their", "strength as even the greatest defenses can be out numbered."};
    }
    else if(type == EnemyType.PHOENIX) {
      sprite = new Sprite("Phoenixes_Scroll.png");
      info = new String[]{"The Phoenix is a rare species that rely heavily on their speed and", "agility to avoid damage and are capable to flying over any", "defense. Unfortunately the phoenix species have been hunted over the", "years for their high priced feathers and are low in numbers."};
    }
    else if(type == EnemyType.INTRO1) {
      xLoc = 135;
      yLoc = 190;
      sprite = new Sprite("scroll.png"); 
      info = new String[]{"723 B.C. The great Aranian Empire is the current leading superpower of", 
                          "the medieval world. Its borders spanned ocean to ocean and its armies",
                          "continued to explore new lands to securing trade routes and raw materials.",
                          "Modest in their success, they do not take from land that is already inhabited.",
                          "However, one general broke this rule and used his power to burn down a", 
                          "village so that he could harvest the goldmine below it. When word spread back",
                          "to the emperor, the general was disavowed, striped of his possessions for his",
                          "greed and banished to the mountain regions outside the empire."};
    }
    else if(type == EnemyType.INTRO2) {
      xLoc = 135;
      yLoc = 190;
      sprite = new Sprite("scroll.png"); 
      info = new String[]{"738 B.C, unbeknownst to the empire, the ex general had spent his time", 
                          "cultivating an army of monsters and actively planning out his revenge. The",
                          "unexpecting empire, having endured a long period of peace between its",
                          "neighbouring nations had its guard down and within a few short months was",
                          "on the brink of destruction having been pushed back to the final stronghold", 
                          "of its defense. Lose now and the once great empire will have fallen for",
                          "good, but succeed and you buy enough time for your allied armies to arrive",
                          "and will have a strong foothold to mount your counterattack."};
    }
  }
  
  public void init() {
    font = createFont("Gothic.ttf", 18, true);
  }
  
  public void update() {
    
  }
  
  public void render() {
    textFont(font);
    //fill(125, 2, 88); // magenta
    fill(0, 0, 0);
    image(sprite.getImage(), 0, 0);
    for(int i = 0; i < info.length; i++) {
      text(info[i], xLoc, yLoc + (i * 30));
    }
    
    fill(255, 0, 0);
    text("Continue", 366, 500);
  }
  
  public void keyPressed(String key) {
    if(key.equalsIgnoreCase("enter")) {
      gsm.getStates().pop();
    }
  }
  public void keyReleased(String key) {
    
  }
  
  public void mousePressed() {
    
  }
  public void mouseDragged() {
    
  }
  public void mouseReleased() {
    
  }
}