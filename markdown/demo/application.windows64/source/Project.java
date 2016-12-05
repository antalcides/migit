import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import java.util.ArrayList; 
import java.util.Stack; 
import java.util.ArrayList; 
import java.util.*; 
import java.util.ArrayList; 
import java.util.List; 
import java.awt.Rectangle; 
import javax.imageio.ImageIO; 
import java.io.IOException; 
import java.awt.image.BufferedImage; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Project extends PApplet {



private Game game;

private AudioPlayer gameloopSound;
private AudioPlayer lightningSound; 
private Minim minim;//audio context

public static final int WIDTH = 800;
public static final int HEIGHT = 600;

public void setup() {
  
  game = new Game();
  minim = new Minim(this);
  gameloopSound = minim.loadFile("Siege_Loop.mp3", 2048);
  gameloopSound.loop();
  lightningSound = minim.loadFile("Thunder_Sound.wav", 2048);
}

public void draw() {
  game.update();
  game.render();
}

// Key Controller
public void keyPressed() {
   if(key == 'w' || keyCode == UP)
     game.keyPressed("up");
   else if(key == 's' || keyCode == DOWN)
     game.keyPressed("down");
   else if(key == 'a' || keyCode == LEFT) 
     game.keyPressed("left");
   else if(key == 'd' || keyCode == RIGHT)
     game.keyPressed("right");
   else if(keyCode == ENTER) //escape key
     game.keyPressed("enter");
   else if(key == '1') 
     game.keyPressed("1");
   else if(key == '2')
     game.keyPressed("2");
   else if(key == '3')
     game.keyPressed("3");
   else if(key == '4')
     game.keyPressed("4");
   else if(key == '5')
     game.keyPressed("5");
   else if(key == '6') 
     game.keyPressed("6");
   else if(key == 'b') 
     game.keyPressed("begin");
   else if(key == 'm')
     game.keyPressed("money");
   else if(key == 'h') 
     game.keyPressed("heal");
}
public void keyReleased() {
   if(key == 'w' || keyCode == UP)
     game.keyReleased("up");
   else if(key == 's' || keyCode == DOWN)
     game.keyReleased("down");
   else if(key == 'a' || keyCode == LEFT) 
     game.keyReleased("left");
   else if(key == 'd' || keyCode == RIGHT)
     game.keyReleased("right");
   else if(key == '1') 
     game.keyReleased("1");
   else if(key == '2')
     game.keyReleased("2");
   else if(key == '3')
     game.keyReleased("3");
   else if(key == '4')
     game.keyReleased("4");
   else if(key == '5')
     game.keyReleased("5");
   else if(key == '6')
     game.keyReleased("6");
}

// Mouse Controller
public void mousePressed() {
  game.mousePressed();
}
public void mouseDragged() {
  game.mouseDragged();
}
public void mouseReleased() {
  game.mouseReleased();
}

class Game {
  
 private GameStateManager gsm;
  
 // Initialize instances of objects
 public Game() {
   //start the gsm and give it the state
   gsm = new GameStateManager();
   MenuState state = new MenuState(gsm);
   gsm.init(state);
 }
 
 public void update() {
   gsm.update();
 }
 
 public void render() {
   gsm.render();
 }
 
 public void keyPressed(String key) {
   gsm.keyPressed(key);
 }
 public void keyReleased(String key) {
   gsm.keyReleased(key); 
 }
 public void mousePressed() {
   gsm.mousePressed();
 }
 public void mouseDragged() {
   gsm.mouseDragged();
 }
 public void mouseReleased() {
   gsm.mouseReleased();
 }
}
public class AmpTower extends Tower {
  
  private float projectileSpeed = 12.3f;
  private int projectileSize = 4;
  private RGB colour = new RGB(255, 0, 255);
  
  private int ampLength = 180;
  private int ampPower = 1;
  
  public AmpTower(Tile tile, GameState state, PImage image) {
    super(tile, state);
    this.image = image;
  }
  
  public void init() {
    cost = 150;
    damage = 1;
    attackSpeed = 30;
    range = 50;
  }
  
  public void update() {
    checkShoot();  
  }
  
  public void render(int xOffset, int yOffset) {
    super.renderTower(xOffset, yOffset);
  }
  
  int current = 0;
  // Checks to see if the tower can attack
  private void checkShoot() {
    current++;
    if(current % attackSpeed == 0) {
      shouldShoot = true;  
    }
    if(shouldShoot) {
      // Perform attacks
      Mob target = null;
      Mob currentTarget = null;
      for(int i = 0; i < state.enemies.size(); i++) {
        currentTarget = state.enemies.get(i);
        if(currentTarget.getHealth() > 0 && Math.abs((tile.x << 5) - currentTarget.getX()) <= range && Math.abs((tile.y << 5) - currentTarget.getY()) <= range) {
          currentTarget.hit(damage);
          currentTarget.amp(ampLength, ampPower);
          //int lifeTime = (int)((Math.abs((currentTarget.getX() - (tile.x << 5))) + Math.abs((currentTarget.getY() - (tile.y << 5)))) / (projectileSpeed * 1.6));
          state.projectiles.add(new Projectile((tile.x << 5) + 15, (tile.y << 5) + 15, currentTarget.getX() + 15, currentTarget.getY() + 15, projectileSpeed, projectileSize, projectileSize, 200, colour, state.getTilemap()));
          shouldShoot = false;
          current = 0;
          break;
        }
      }
      
      // Reset current
      current = 0;
    }
  }
  
}
public class BasicTower extends Tower {
  
  private float projectileSpeed = 12.3f;
  private int projectileSize = 4;
  private RGB colour = new RGB(255, 0, 0);
  
  public BasicTower(Tile tile, GameState state, PImage image) {
    super(tile, state);
    this.image = image;
  }
  
  public void init() {
    cost = 100;
    damage = 5;
    attackSpeed = 60;
    range = 150;
  }
  
  public void update() {
    checkShoot();  
  }
  
  public void render(int xOffset, int yOffset) {
    super.renderTower(xOffset, yOffset);
  }
  
  int current = 0;
  // Checks to see if the tower can attack
  private void checkShoot() {
    current++;
    if(current % attackSpeed == 0) {
      shouldShoot = true;  
    }
    if(shouldShoot) {
      // Perform attacks
      Mob target = null;
      Mob currentTarget = null;
      for(int i = 0; i < state.enemies.size(); i++) {
        currentTarget = state.enemies.get(i);
        if(currentTarget.getHealth() > 0 && Math.abs((tile.x << 5) - currentTarget.getX()) <= range && Math.abs((tile.y << 5) - currentTarget.getY()) <= range) {
          currentTarget.hit(damage);
          //int lifeTime = (int)((Math.abs((currentTarget.getX() - (tile.x << 5))) + Math.abs((currentTarget.getY() - (tile.y << 5)))) / (projectileSpeed * 1.6));
          state.projectiles.add(new Projectile((tile.x << 5) + 15, (tile.y << 5) + 15, currentTarget.getX() + 15, currentTarget.getY() + 15, projectileSpeed, projectileSize, projectileSize, 200, colour, state.getTilemap()));
          shouldShoot = false;
          current = 0;
          break;
        }
      }
      
      // Reset current
      current = 0;
    }
  }
  
}
public class CooldownManager {
  
  private Mob mob;
  
  
  public CooldownManager(Mob mob) {
    this.mob = mob;
  }
  
  public void update() {
   
  }
  
  public class Cooldown {
   
    public Cooldown() {
      
    }
    
  }
}
public class CreditsState extends GameState {
  
  private PFont font1, font2;
  private float currentY;
  
  public CreditsState(GameStateManager gsm) {
    super(gsm); 
  }
  
  public void init() {
    font1 = createFont("Gothic.ttf", 64, true);
    font2 = createFont("Gothic.ttf", 26, true);
    currentY = 600;
  }
  
  public void update() {
    currentY -= 1.1f;
    if(currentY <= -260)
      currentY = 600;
  }

  public void render() {
    fill(0);
    rect(0, 0, Project.WIDTH, Project.HEIGHT);
    
    textFont(font1);
    fill(255, 0, 0);
    text("Back", 590 - (4 * 13), 550);
    
    // render text
    textFont(font2);
    text("Developed and Designed By:", 25, 20 + currentY);
    text("Brady Jessup", 50, 120 + currentY);
    text("Cole Traynor", 50, 220 + currentY);
  }
  
  
  public void keyPressed(String key) {
    if(key.equalsIgnoreCase("enter")) 
      gsm.getStates().pop();
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
public class Entity {
  
   protected float x, y;
   protected boolean shouldRemove;
   
   public Entity(float x, float y) {
     this.x = x;
     this.y = y;
   }
   
   // getters
   public float getX() {
     return x; 
   }
   public float getY() {
    return y; 
   }
   public boolean getShouldRemove() {
     return shouldRemove;  
   }
}
public class Flyer extends Mob {
  
  public Sprite[] anim = {new Sprite("flying1.png"), new Sprite("flying2.png"), new Sprite("flying3.png"), new Sprite("flying4.png")};
  private int currentSprite = 0;
  public final int animSpeed = 7; // Lower the int, the faster the animation
  
  public Flyer(float x, float y, Tilemap map) {
    super(x, y, map);
  }
  
  public void init() {
    // Statistics
    health = 150; 
    maxHealth = health;
    xSpeed = 5f;
    ySpeed = 5f;
    width = 32;
    height = 32;
    worth = 50;
    damage = 1;
  }
  
  public void update() {
    super.checkSlow();
    super.checkDot();
    super.checkAmp();
    super.checkSnare();
    move();  
    checkLife();
  }
  
  private int counter = 0;
  public void render(int xOffset, int yOffset) {
    if(shouldShow) {
      image(anim[currentSprite].getImage(), x - xOffset - 16, y - yOffset - 16, 48, 48);
      super.renderHealth(xOffset, yOffset);
    }
    
    if(!snared) {
      // Animate the sprite
      counter++;
      if(counter >= animSpeed) {
        counter = 0;
        currentSprite++;
        if(currentSprite >= 4) 
          currentSprite = 0;
      }
    }
  }
  
  
  private void move() {
    if(!snared) {
      // Move towards current goal ignoring towers
      x -= xSpeed;
        
      // Checks to see if the unit is approaching the castle
      if(((int)x >> 5) < 19)
        shouldRemove = true;
    }
  }
  
  private void checkLife() {
    if(health <= 0) {
      shouldRemove = true;
      map.getState().getPlayer().addGold(worth);
    }
  }
}


public abstract class GameState {
  
  // Graphics for the gamestate
  public Sprite cursorImage = new Sprite("cursor.png");
  
  public Spritesheet tiles = new Spritesheet("tiles.bmp", 32, 32);
  public Sprite castleFloor = new Sprite(0, 0, tiles);
  public Sprite water = new Sprite(1, 0, tiles);
  public Sprite grass = new Sprite(2, 0, tiles);
  public Sprite sand = new Sprite(3, 0, tiles);
  public Sprite wood = new Sprite(4, 0, tiles);
  
  public Sprite castle = new Sprite("Castle.png");
  
  public Spritesheet towers = new Spritesheet("towers.png", 32, 32);
  public Sprite basicTower = new Sprite(0, 0, towers);
  public Sprite slowTower = new Sprite(1, 0, towers);
  public Sprite poisonTower = new Sprite(2, 0, towers);
  public Sprite ampTower = new Sprite(3, 0, towers);
  public Sprite snareTower = new Sprite(4, 0, towers);
  
  // UI
  public Sprite infoUI = new Sprite("infoUI.png");
  
  // Lists to update and render
  protected List<Particle> particleList = new ArrayList<Particle>();
  public List<Mob> enemies;
  public List<Projectile> projectiles;
  protected Tilemap map;
  
  protected Player player;
  
  protected GameStateManager gsm;
  
  public GameState(GameStateManager gsm) {
    this.gsm = gsm;
    
    init();
  }
  
  public abstract void init();
  public abstract void update();
  public abstract void render();
  
  public abstract void keyPressed(String key);
  public abstract void keyReleased(String key);
  
  public abstract void mousePressed();
  public abstract void mouseDragged();
  public abstract void mouseReleased();
  
  // getters
  public GameStateManager getGSM() {
    return gsm; 
  }
  
  // setters
  public void addParticle(Particle p) {
    particleList.add(p); 
  }
  public Tilemap getTilemap() {
    return map;  
  }
  public Player getPlayer() {
    return player;  
  }
}


public class GameStateManager {
  
 private Stack<GameState> stack; 
  
 public GameStateManager() {
   stack = new Stack<GameState>();
 }
 
 public void init(GameState state) {
   stack.push(state);
 }
 
 public void update() {
   if(stack.size() == 0) return;
   stack.peek().update();
 }
 
 public void render() {
   if(stack.size() == 0) return;
   stack.peek().render();
 }
 
 public void keyPressed(String key) {
   if(stack.size() == 0) return;
   stack.peek().keyPressed(key); 
 }
 public void keyReleased(String key) {
   if(stack.size() == 0) return;
   stack.peek().keyReleased(key);
 }
 
 public void mousePressed() {
   if(stack.size() == 0) return;
   stack.peek().mousePressed();
 }
 public void mouseDragged() {
   if(stack.size() == 0) return;
   stack.peek().mouseDragged();
 }
 public void mouseReleased() {
   if(stack.size() == 0) return;
   stack.peek().mouseReleased();
 }
 
 // Getters
 public Stack<GameState> getStates() {
   return stack; 
 }
 
}
public class Grunt extends Mob {
  
  public Sprite[] anim = {new Sprite("grunt1.png"), new Sprite("grunt2.png"), new Sprite("grunt3.png"), new Sprite("grunt4.png")};
  private int currentSprite = 0;
  public final int animSpeed = 12; // Lower the int, the faster the animation
  
  private Stack<Node> pathing;
  private Node currentGoal;
  
  public Grunt(float x, float y, Tilemap map, Stack<Node> pathing) {
    super(x, y, map);
    this.pathing = pathing;
    currentGoal = pathing.pop();
  }
  
  public void init() {
    // Statistics
    health = 200; 
    maxHealth = health;
    xSpeed = 2f;
    ySpeed = 2f;
    width = 32;
    height = 32;
    worth = 25;
    damage = 1;
  }
  
  public void update() {
    super.checkSlow();
    super.checkDot();
    super.checkAmp();
    super.checkSnare();
    if(!snared) {
      move();  
    }
    checkLife();
  }
  
  private int counter = 0;
  public void render(int xOffset, int yOffset) {
    if(shouldShow) {
      image(anim[currentSprite].getImage(), x - xOffset, y - yOffset, 31, 31);
      super.renderHealth(xOffset, yOffset);
    }
    
    if(!snared) {
      // Animate the sprite
      counter++;
      if(counter >= animSpeed) {
        counter = 0;
        currentSprite++;
        if(currentSprite >= 4) 
          currentSprite = 0;
      }
    }
  }
  
  
  private void move() {
    if(!snared) {
      // Move towards current goal
      if((currentGoal.x << 5) > x)
        x += xSpeed;
      if((currentGoal.x) << 5 < x)
        x -= xSpeed;
      if((currentGoal.y << 5) > y)
        y += ySpeed;
      if((currentGoal.y << 5) < y)
        y -= ySpeed;
        
      // Check if the goal was basically reached
      if(Math.abs((currentGoal.x << 5) - x) < 4 && Math.abs((currentGoal.y << 5) - y) < 4)
        currentGoal = pathing.pop();
        
      // Checks to see if the unit is approaching the castle
      if(((int)x >> 5) < 19) 
        shouldRemove = true;
    }
  }
  
  private void checkLife() {
    if(health <= 0) {
      shouldRemove = true;
      map.getState().getPlayer().addGold(worth);
    }
  }
}
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
public class InterchangeableFloorTile extends Tile {
  
  public InterchangeableFloorTile(int x, int y, PImage image) {
    super(x, y, image);
  }
  
  public void init() {
    projectileSolid = false;
    walkSolid = false;
  }
  
  public void update() {
    // Check if there is a twoer at this position
    if(tower != null) {
      tower.update();
    }
  }
  
  public void render(int xOffset, int yOffset) {
    image(image, (x << 5) - xOffset, (y << 5) - yOffset);
    
    // Check if there is a tower at this position
    if(tower != null) {
      tower.render(xOffset, yOffset);
    }
  }
  
}
public class Kronos extends Mob {
  
  public Spritesheet sheet = new Spritesheet("Kronos.png", 32, 32);
  public Sprite[][] anim = {{new Sprite(1, 0, sheet), new Sprite(0, 0, sheet), new Sprite(2, 0, sheet)},
                            {new Sprite(1, 3, sheet), new Sprite(0, 3, sheet), new Sprite(2, 3, sheet)},
                            {new Sprite(1, 2, sheet), new Sprite(0, 2, sheet), new Sprite(2, 2, sheet)},
                            {new Sprite(1, 1, sheet), new Sprite(0, 1, sheet), new Sprite(2, 1, sheet)}};
  public Sprite[] lightningAnim = {new Sprite("Lightning1.png"), new Sprite("Lightning2.png"), new Sprite("Lightning3.png"), new Sprite("Lightning4.png"), new Sprite("Lightning5.png")};
  private int currentLightning = 0;
  public boolean flash;
  
  private int currentSet = 0; // current set of sprites currently being rendered ( 0=down, 1=up, 2=right, 3=left )
  private int currentSprite = 1; // current sprite being rendered ( 0=idle, 1=move1, 2=move2 )
  public final int animSpeed = 20; // Lower the int, the faster the animation
  private boolean moveUp, moveDown, moveRight, moveLeft;
  
  private Stack<Node> pathing;
  private Node currentGoal;
  
  // Phase 0 - Prep Phase
  // Phase 1 - Lightning Phase
  // Phase 2 - Movement
  private int phase = 0;
  
  public Kronos(float x, float y, Tilemap map, Stack<Node> pathing) {
    super(x, y, map);
    this.pathing = pathing;
    currentGoal = pathing.pop();
  }
  
  public void init() {
    // Statistics
    health = 2000; 
    maxHealth = health;
    xSpeed = 2.4f;
    ySpeed = 2.4f; 
    width = 32;
    height = 32;
    worth = 500;
    damage = 5;
  }
  
  public void update() {
    super.checkSlow();
    super.checkDot();
    super.checkAmp();
    super.checkSnare();
    checkPhase();
    checkLife();
  }
  
  int prepCounter = 38;
  private void checkPhase() {
    if(phase == 0) {
      currentSprite = 0;
      if(prepCounter == 38) {
        lightningSound.play();  
      }
      prepCounter--;
      if(prepCounter == 0) {
        phase++;  
      }
    }
    else if(phase == 1) {
      lightning();
    }
    else if(phase == 2) {
      move();  
    }
  }
  
  private int counter = 0;
  public void render(int xOffset, int yOffset) {
    if(moveUp) {
      currentSet = 1;
    }
    else if(moveDown) {
      currentSet = 0;
    }
    if(moveRight) {
      currentSet = 2;
    }
    else if(moveLeft) {
      currentSet = 3;
    }
    
    if(shouldShow) {
      image(anim[currentSet][currentSprite].getImage(), x - xOffset + 2, y - yOffset + 2);
      super.renderHealth(xOffset, yOffset);
    }
    if(phase == 1) {
      currentSprite = 0;
      switch(currentLightning) {
        case 0: image(lightningAnim[0].getImage(), x - xOffset - (lightningAnim[0].getWidth() * 2), y - yOffset - 32, lightningAnim[0].getWidth() * 2, lightningAnim[0].getHeight() * 2);
        break;
        case 1: image(lightningAnim[1].getImage(), x - xOffset - (lightningAnim[1].getWidth() * 2), y - yOffset - 34, lightningAnim[1].getWidth() * 2, lightningAnim[1].getHeight() * 2);
        break;
        case 2: image(lightningAnim[2].getImage(), x - xOffset - (lightningAnim[2].getWidth() * 2), y - yOffset - 29, lightningAnim[2].getWidth() * 2, lightningAnim[2].getHeight() * 2);
        break;
        case 3: image(lightningAnim[3].getImage(), x - xOffset - (lightningAnim[3].getWidth() * 2), y - yOffset - 40, lightningAnim[3].getWidth() * 2, lightningAnim[3].getHeight() * 2);
        break;
        case 4: image(lightningAnim[4].getImage(), x - xOffset - (lightningAnim[4].getWidth() * 2), y - yOffset - 44, lightningAnim[4].getWidth() * 2, lightningAnim[4].getHeight() * 2);
        break;
      }
      if(counter % 13 == 0) {
        currentLightning++;  
        if(currentLightning > 4) {
          phase++;
          currentSprite = 1;
          flash = true;
        }
      }
    }
    
    if(!snared) {
      // Animate the sprite
      counter++;
      if(counter >= animSpeed) {
        counter = 0;
        currentSprite++;
        if(currentSprite >= 3) 
          currentSprite = 1;
      }
    }
  }

  private void lightning() {
    moveLeft = true;        
  }
  
  private void move() {
    if(!snared) {
      // Check previous movement and change sprite depending on direction
      float prevX = x, prevY = y;
      moveUp = false;
      moveDown = false;
      moveRight = false;
      moveLeft = false;
      
      
      // Move towards current goal
      if((currentGoal.x << 5) > x) {
        x += xSpeed;
      }
      if((currentGoal.x) << 5 < x) {
        x -= xSpeed;
      }
      if((currentGoal.y << 5) > y) {
        y += ySpeed;
      }
      if((currentGoal.y << 5) < y) {
        y -= ySpeed;
      }
      
      // Check previous movement and change sprite depending on direction
      if(x > prevX) 
        moveRight = true;
      else if(x < prevX)
        moveLeft = true;
      else if(y > prevY) 
        moveDown = true;
      else if(y < prevY)
        moveUp = true;
        
      // Check if the goal was basically reached
      if(Math.abs((currentGoal.x << 5) - x) < 6 && Math.abs((currentGoal.y << 5) - y) < 6)
        currentGoal = pathing.pop();
        
      // Checks to see if the unit is approaching the castle
      if(((int)x >> 5) < 19)
        shouldRemove = true;
    }
  }
  
  private void checkLife() {
    if(health <= 0) {
      shouldRemove = true;
      map.getState().getPlayer().addGold(worth);
    }
  }
}



public class LevelOneState extends GameState {
 
 private Sprite ship = new Sprite("ship.png");
 private int shipX = 75 * 32 + 3;
 private int shipY = 375; 
  
 private LevelOneUI ui;
 public WaveManager waveManager;
 
 private int xDest, yDest;
 private Stack<Node> pathing;
 
 public int castleHealth = 20;
 private PFont font;
 
 private boolean flash; // For Kronos
 
 public LevelOneState(GameStateManager gsm) {
   super(gsm);
 }
 
 public void init() {
   waveManager = new WaveManager(74, 17, this);
   map = new Tilemap("level1.png", 1024, 1024, this);
   player = new Player(1024, 1024, this);
   ui = new LevelOneUI(this);
   enemies = new ArrayList<Mob>();
   projectiles = new ArrayList<Projectile>();
   font = createFont("Gothic.ttf", 24, true);
   
   xDest = 17;
   yDest = 17;
   pathing = findPath(74, 17, xDest, yDest);
 }
 
 public void update() {
   map.update();
   player.update();
   updateLists();
   checkRemoved();
   waveManager.update();
   checkPathing();
 }
 
 int protoEnd = 0;
 public void render() {
   map.render();
   renderCastle();
   image(ship.getImage(), shipX - map.getXOffset(), shipY - map.getYOffset(), ship.getWidth() * 3, ship.getHeight() * 3);
   renderLists();
   image(infoUI.getImage(), 0, 0);
   player.render(map.getXOffset(), map.getYOffset());
   renderCastleLife();
   checkCastleLife();
   waveManager.render();
   ui.render();
   checkFlash();
 }
 
 private void renderCastle() {
   if(player.x < 1150) {
     image(castle.getImage(), (9 * 32) - map.getXOffset(), (10 * 32) - map.getYOffset());  
   }
 }
 
 private void renderCastleLife() {
   fill(125, 2, 88);
   textFont(font);
   text("Castle Health Remaining: " + castleHealth, 520, 25);  
 }
 
 private void checkRemoved() {
   for(int i = 0; i < enemies.size(); i++) {
     if(enemies.get(i).getShouldRemove()) {
       if(((int)enemies.get(i).x >> 5) < 19)
         castleHealth -= enemies.get(i).damage;
       enemies.remove(i);    
     }
   }
   for(int i = 0; i < projectiles.size(); i++) {
     if(projectiles.get(i).getShouldRemove()) {
       projectiles.remove(i);  
     }
   }
   for(int i = 0; i < particleList.size(); i++) {
     if(particleList.get(i).getShouldRemove()) {
       particleList.remove(i);  
     }
   }
 }
 
 private RGB green = new RGB(0, 255, 0);
 private RGB blue = new RGB(0, 0, 255);
 private RGB magenta = new RGB(255, 0, 255);
 private Random random = new Random();
 private void updateLists() {
   for(int i = 0; i < enemies.size(); i++) {
     Mob temp = enemies.get(i);
     temp.update();  
     if(temp.poisoned && waveManager.ticksIntoWave % 12 == 0) {
       particleList.add(new Particle(temp.x + 14, enemies.get(i).y + 14, (float)random.nextGaussian(), (float)random.nextGaussian(), 4, 4, 30, green, RenderType.OFFSET));  
     }
     if(temp.slowed && waveManager.ticksIntoWave % 12 == 0) {
       particleList.add(new Particle(temp.x + 14, enemies.get(i).y + 14, (float)random.nextGaussian(), (float)random.nextGaussian(), 4, 4, 30, blue, RenderType.OFFSET));  
     }
     if(temp.amped && waveManager.ticksIntoWave % 12 == 0) {
       particleList.add(new Particle(temp.x + 14, enemies.get(i).y + 14, (float)random.nextGaussian(), (float)random.nextGaussian(), 4, 4, 30, magenta, RenderType.OFFSET));
     }
   }
   for(int i = 0; i < projectiles.size(); i++) {
     projectiles.get(i).update();  
   }
   for(int i = 0; i < particleList.size(); i++) {
     particleList.get(i).update();
   }
 }
 
 private void renderLists() {
   for(int i = 0; i < particleList.size(); i++) {
     particleList.get(i).render(map.getXOffset(), map.getYOffset());
   }
   for(int i = 0; i < enemies.size(); i++) {
     enemies.get(i).render(map.getXOffset(), map.getYOffset());
   }
   for(int i = 0; i < projectiles.size(); i++) {
     projectiles.get(i).render(map.getXOffset(), map.getYOffset());  
   }
 }
 
 private int timer = 0;
 private void checkFlash() {
   if(flash) {
     // Remove all the towers in a line to the base (Kronos destroyed them)
     if(timer == 0) {
       for(int x = 20; x < 76; x++) {
         map.removeTower(x, 17);
       }
       // Calculate the new path
       Kronos k = (Kronos)enemies.get(0);
       k.pathing = calculateAIPath(74, 17);
     }
     
     fill(255, 255, 255, 255 - timer);
     rect(0, 0, 800, 600);
     timer++;
     if(timer == 300) {
       flash = false;  
     }
   }
 }
 
 int counter = 0;
 private void checkCastleLife() {
   if(castleHealth <= 0) {
     castleHealth = 0;
     fill(125, 2, 88);
     textFont(font);
     text("Your Kingdom Has Been Destroyed!", 225, 275);
     counter++;
     if(counter > 360) {
       gsm.getStates().pop();  
       gsm.getStates().push(new MenuState(gsm));
     }
   }
 }
 
 // Method that ensures that pathing is available, and if it is not. Then destroy towers until a path can be made
 private void checkPathing() {
   if(pathing == null) {
     while(pathing == null) {
       map.destroyRandomTower();
       pathing = findPath(74, 17, xDest, yDest);
     }
   }
 }
 
 // A* Pathfinding
 public Stack<Node> findPath(int xStart, int yStart, int xDest, int yDest) {
   List<Node> openList = new ArrayList<Node>();
   List<Node> closedList = new ArrayList<Node>();
   Node current = new Node(xStart, yStart, null, 0, getDistance(xStart, yStart, xDest, yDest));
   openList.add(current);
   // Keep going until everything is searched
   while(openList.size() > 0) {
     // Move the nodes with the lowest costs to the front
     Collections.sort(openList);
     current = openList.get(0);
     // If path is find return our path
     if(current.x == xDest && current.y == yDest) {
       Stack<Node> stack = new Stack<Node>();
       while(current.parent != null) {
         stack.push(current);
         current = current.parent;
       }
       openList.clear();
       closedList.clear();
       return stack;
     }
     openList.remove(current);
     closedList.add(current);
     // Loop through adjacent tiles (not diagonal)
     for(int i = 0; i < 4; i++) {
       int x = current.x;
       int y = current.y;
       int xi = 0;
       int yi = 0;
       if(i == 0) {
         xi = -1;
       }
       else if(i == 1) {
         yi = -1;
       }
       else if(i == 2) {
         yi = 1;
       }
       else if(i == 3) {
         xi = 1;
       }
       Tile at = map.getTile((x + xi) << 5, (y + yi) << 5);
       if(at == null) continue;
       if(at.getWalkSolid()) continue;
       int newX = x + xi;
       int newY = y + yi;
       double gCost = current.gCost + getDistance(x, y, newX, newY);
       double hCost = getDistance(x, y, xDest, yDest);
       Node node = new Node(newX, newY, current, gCost, hCost);
       if(coordInList(closedList, newX, newY) && gCost >= node.gCost) continue;
       if(!coordInList(openList, newX, newY) || gCost < node.gCost) openList.add(node);
     }
   }
   closedList.clear();
   return null;
 }
 
 private boolean coordInList(List<Node> list, int x, int y) {
   for(Node n: list) {
     if(n.x == x && n.y == y) {
       return true;
     }
   }
   return false;
 }
 
 // Heuristic Calc
 private double getDistance(int xStart, int yStart, int xDest, int yDest) {
   double dx = xStart - xDest;
   double dy = yStart - yDest;
   return Math.sqrt(dx * dx + dy * dy);
   //return ((Math.abs((xStart >> 5) - (xDest >> 5))) + (Math.abs((yStart >> 5) - (yDest >> 5))));
 }
 
 private Stack<Node> calculateAIPath(int x, int y) {
   pathing = findPath(x, y, xDest, yDest);  
   return pathing;
 }
 
 // Key Controller
 public void keyPressed(String key) {
   player.keyPressed(key);
   waveManager.keyPressed(key);
   
   if(key.equalsIgnoreCase("heal")) {
     castleHealth += 1;  
   }
 }
 public void keyReleased(String key) {
   player.keyReleased(key);  
 }
 
 // Mouse Controller
 public void mousePressed() {
   ui.mousePressed();
   player.mousePressed();
 }
 public void mouseReleased() {
   
 }
 public void mouseDragged() {
   
 }
 
 // Getters
 public Tilemap getTilemap() {
   return map;  
 }
 public Player getPlayer() {
   return player;  
 }
 public void requestPath(int x, int y) {
   findPath(x, y, xDest, yDest);  
 }
}
public class LevelOneUI {
 
  protected LevelOneState state;
  private UIButton[] buttons;
  
  public LevelOneUI(LevelOneState state) {
    this.state = state;  
    setup();
  }
  
  public void setup() {
    buttons = new UIButton[] {
      new TowerPurchaseButton(100 - 16, height - 75, new Sprite("ProjectileTowerUI.bmp").getImage(), 1, new String("Basic Tower that fires projectiles at enemies\nDamage: 5\nAttack Time: 60\nRange: 150\nCost: 100"), 128, 291),
      new TowerPurchaseButton(250 - 16, height - 75, new Sprite("SlowTowerUI.bmp").getImage(), 2, new String("Slowing Tower that slows enemy units movement\nDamage: 5\nAttack Time: 90\nRange: 125\nCost: 150"), 145, 291),
      new TowerPurchaseButton(400 - 16, height - 75, new Sprite("PoisonTowerUI.bmp").getImage(), 3, new String("Poison Tower that poisons enemy units (stackable)\nDamage: 2\nAttack Time: 30\nRange: 200\nCost: 200"), 150, 291),
      new TowerPurchaseButton(550 - 16, height - 75, new Sprite("AmpTowerUI.bmp").getImage(), 4, new String("Amplification Tower weakens the armour of the enemy\nDamage: 1\nAttack Time: 30\nRange: 50\nCost: 150"), 168, 291),
      new TowerPurchaseButton(700 - 16, height - 75, new Sprite("SnareTowerUI.bmp").getImage(), 5, new String("Snare Tower stops your enemies from moving\nDamage: 3\nAttack Time: 180\nRange: 150\nCost: 250"), 135, 291)
    };
  }
   
  
  public void render() {
      for (UIButton button: buttons) {
         button.render(); 
      }
      for (UIButton button: buttons) {
         if (button.isMouseInside()) {
           button.inside();
         }
      }
  }
  
  public void mousePressed() {
    /*for (UIButton button: buttons) {
         if (button.isMouseInside()) {
           button.click();
         }
    }*/
  }
  
}



public class MenuState extends GameState {
 
 //Logo 
 private Sprite logo;
  
 private Tilemap map;
 
 private String[] choices = { "Play", "Credits", "Quit" };
 private PFont font;
 private int currentChoice = 0;
  
 public MenuState(GameStateManager gsm) {
   super(gsm);
 }
 
 public void init() {
   cursor(cursorImage.getImage(), 0, 0);
   map = new Tilemap("menu.png", 64, 64, this);
   font = createFont("Gothic.ttf", 64, true);
   logo = new Sprite("Logo.png");
   textFont(font);
 }
 
 public void update() {
   map.update();
   moveMap();
   spawnParticles();
   updateLists();
   checkRemoved();
   
   // Smooth map loop
   if(map.getYOffset() >= 3600) {
     map.setOffset(64, 64 + (map.getYOffset() % 3600)); 
   }
 }
 
 public void render() {
   map.render();
   renderLists();
   
   // Draw logo
   image(logo.getImage(), 245, 10);
   
   textFont(font);
   // Draw choices
   for(int i = 0; i < choices.length; i++) {
     if(currentChoice == i) {
       fill(255, 0, 0);  
     }
     else {
       fill(255);
     }
     text(choices[i], 387 - (choices[i].length() * 10), 300 + 125 * i);
   }
 }
 
 private void checkRemoved() {
   for(int i = 0; i < particleList.size(); i++) {
     if(particleList.get(i).shouldRemove) {
       particleList.remove(i);
     }
   }
 }
 
 private void moveMap() {
   map.addOffset(0, 2); 
 }
 
 private void updateLists() {
   for(int i = 0; i < particleList.size(); i++) {
     particleList.get(i).update();
   }
 }
 
 private void renderLists() {
   for(int i = 0; i < particleList.size(); i++) {
     particleList.get(i).render(map.getXOffset(), map.getYOffset());
   }
 }
 
 private void spawnParticles() {
   int changeY = (int)(Math.random() * 50 - 25);
   int startY = 0;
   
   switch(currentChoice) {
     case 0:
       startY = 275;
       break;
     case 1:
       startY = 400;
       break;
     case 2:
       startY = 525;
       break;
   }
   
   // Spawn particles
   new Spawner(Type.PARTICLE, -30, startY + changeY, 13.2f, 0f, new RGB(255, 0, 0), 80, 30, 2, 1, RenderType.STATIC, this);
 }

  
  // Key Controller
 public void keyPressed(String key) {
   // Check if the player hit enter
   if(key.equalsIgnoreCase("enter")) {
     if(currentChoice == 0) {
        gsm.getStates().pop();
        gsm.getStates().push(new LevelOneState(gsm));
        gsm.getStates().push(new InfoState(gsm, EnemyType.INTRO2));
        gsm.getStates().push(new InfoState(gsm, EnemyType.INTRO1));
     }
     else if(currentChoice == 1) {
        gsm.getStates().push(new CreditsState(gsm));
     }
     else {
       System.exit(0);
     }
   }
   
   // If the player changes options, clear the particles
   if(key.equalsIgnoreCase("up")) {
     currentChoice--; 
     particleList.clear();
   }
   else if(key.equalsIgnoreCase("down")) {
     currentChoice++;
     particleList.clear();
   }
   
   // Ensure currentChoice does not go out of bounds
   if(currentChoice <= -1) {
     currentChoice = choices.length - 1;
   }
   else if(currentChoice >= choices.length) {
     currentChoice = 0;
   }
 }
 public void keyReleased(String key) {
   
 }
 
 // Mouse Controller
 public void mousePressed() {
   
 }
 public void mouseReleased() {
   
 }
 public void mouseDragged() {
   
 }
}


public abstract class Mob extends Entity {
  
  protected Rectangle hitbox;
  protected Tilemap map;
  protected int maxHealth;
  protected int health;
  protected float xSpeed, ySpeed;
  protected int width, height;
  public boolean shouldShow = true;
  protected int worth;
  protected int damage;
  
  public boolean slowed;
  public int slowLength;
  public float slowPower;
  
  public boolean poisoned;
  public int dotLength;
  public int dotDps;
  
  public int ampLength;
  public int ampPower;
  public boolean amped;
  
  public boolean snared;
  public int snareLength;
  
  public Mob(float x, float y, Tilemap map) {
    super(x, y);
    this.map = map;
    
    init();
  }
  
  protected void moveX(float xChange) {
    if(!snared) {
      if(map.getTile((int)(x + xChange), (int)y).getWalkSolid()) {
        return;  
      }
      
      // Change player position
      x += xChange;  
    }
  }
  protected void moveY(float yChange) {  
    if(!snared) {
      if(map.getTile((int)x, (int)(y + yChange)).getWalkSolid()) {
        return;  
      }
      
      // Change player position
      y += yChange;
    }
  }
  protected void updateHitbox() {
    hitbox.x = (int)x;
    hitbox.y = (int)y;
  }
  
  public abstract void init();
  public abstract void update();
  public abstract void render(int xOffset, int yOffset);
  
  protected void renderHealth(int xOffset, int yOffset) {
    // Fill the background (red)
    fill(255, 0, 0);
    rect(x - xOffset, y - 12 - yOffset, 32, 8);
    
    // Fill how much health you are missing (green)
    fill(0, 255, 0);
    rect(x - xOffset, y - 12 - yOffset, (health / (float)maxHealth) * 32, 8);
  }
  
  public void hit(int damage) {
    health -= (damage + ampPower);  
  }
  
  public void snare(int snareLength) {
    if(!(this.snareLength > snareLength)) { 
      this.snareLength = snareLength;
      snared = true;
    }
  }
  
  public void slow(float slowPower, int slowLength) {
    // Check to see if the unit is already slowed, if it is, just add more time onto the slow
    if(slowed) {
      this.slowLength += slowLength;
    }
    else {
      slowed = true;
      this.slowLength = slowLength;
      this.slowPower = slowPower;
      
      xSpeed *= slowPower;
      ySpeed *= slowPower;
    }
  }
  
  // Amplifies the damage, that a unit will take
  public void amp(int ampLength, int ampPower) {
    if(amped) {
      this.ampLength += ampLength;  
      if(this.ampPower < ampPower) {
        this.ampPower = ampPower;  
      }
    }
    else {
      amped = true;
      this.ampLength = ampLength;
      this.ampPower = ampPower;
    }
  }
  
  public void dot(int dotDps, int dotLength) {
    this.dotDps += dotDps;
    this.dotLength += dotLength;
    poisoned = true;
  }
  
  protected void checkDot() {
    if(poisoned) {
      dotLength--;
      
      // dot damage
      if(dotLength % 60 == 0) {
        hit(dotDps);
      }
      if(dotLength <= 0) {
        poisoned = false;  
      }
    }
  }
  
  protected void checkSlow() {
    if(slowed) {
      slowLength--;
      if(slowLength <= 0) {
        slowed = false;
        
        // Multiply the speeds by the reciprocal
        xSpeed *= (1/slowPower);
        ySpeed *= (1/slowPower);
      }
    }
  }
  
  protected void checkAmp() {
    if(amped) {
      ampLength--;
      if(ampLength <= 0) {
        amped = false;
        ampPower = 0;
      }
    }
  }
  
  protected void checkSnare() {
    if(snared) {
      snareLength--;
      if(snareLength <= 0) {
         snared = false; 
      }
    }
  }
  
  public void checkDead() {
    if(health <= 0) {
      shouldRemove = true;  
    }
  }
  
  // Getters
  public Rectangle getHitbox() {
    return hitbox; 
  }
  public int getHealth() {
    return health; 
  }
  public Tilemap getMap() {
    return map; 
  }
  
}
public class Node implements Comparable<Node> {
  public int x, y;
  public Node parent;
  public double fCost, gCost, hCost;
  
  public Node(int x, int y, Node parent, double gCost, double hCost) {
    this.x = x;
    this.y = y;
    this.parent = parent;
    this.gCost = gCost;
    this.hCost = gCost;
    this.fCost = this.gCost + this.hCost;
  }
  
  public int compareTo(Node other) {
    if(other.fCost < this.fCost)
      return 1;
    else if(other.fCost > this.fCost)
      return -1;
    else
      return 0;
  }
}
public enum RenderType {
  OFFSET, STATIC; 
}

public class Particle extends Entity {
  
  private float xSpeed, ySpeed;
  private int particleLife;
  
  private RGB colour;
  private int width, height;
  private PImage image;
  private RenderType type;
  
  public Particle(float x, float y, float xSpeed, float ySpeed, int width, int height, int particleLife, RGB colour, RenderType type) {
    super(x, y);
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    this.colour = colour;
    this.width = width;
    this.height = height;
    this.particleLife = particleLife;
    this.type = type;
  }
  
  public Particle(float x, float y, float xSpeed, float ySpeed, int particleLife, PImage image, RenderType type) {
    super(x, y);
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    this.image = image;
    this.particleLife = particleLife;
    this.type = type;
  }
  
  
  public void update() {
    checkLife();
    move();
  }
  
  public void render(int xOffset, int yOffset) {
    // Check rendertype and act accordingly
    if(type == RenderType.STATIC) {
      xOffset = 0;
      yOffset = 0;
    }
    
    if(image == null) {
      fill(colour.red, colour.green, colour.blue);
      rect(x - xOffset, y - yOffset, width, height);
    }
    else {
      image(image, x - xOffset, y - yOffset);
    }
  }
  
  int currentLife = 0;
  private void checkLife() {
    currentLife++;
    if(currentLife >= particleLife)
      shouldRemove = true;
  }
  
  private void move() {
    x += xSpeed;
    y += ySpeed;
  }
  
}
public class Player extends Mob {
 
 // Camera controls
 private float panSpeed = 4.1f;
 private int panArea = 25;
 private boolean moveUp, moveDown, moveRight, moveLeft; 
 private PFont font;
 private LevelOneState state;
 
 private Tower towerToPlace; // The tower that the player currently clicked on to place (will be null must of the time)
 private Tower focusedTower; // The tower the player is looking at (will be null most of the time)
 
 private int gold;
  
 public Player(float x, float y, LevelOneState state) {
   super(x, y, state.getTilemap());
   this.state = state;
   
   init();
 }
 
 // Test
 public void init() {
   gold = 2500; 
   xSpeed = panSpeed;
   ySpeed = xSpeed / 4 * 3;
   font = createFont("Gothic.ttf", 24, true);
   /*health = 100;
   width = 32;
   height = 32;
   hitbox = new Rectangle((int)x, (int)y, width, height);*/
 }
 
 public void update() {
   checkPan();
   checkMovement();
   checkOffset();   
 }
 
 public void render(int xOffset, int yOffset) {
   // Draw how much gold the player has
   textFont(font);
   fill(125, 2, 88);
   text("Gold: " + gold, 10, 25);
   
   // Draw what wave the player is on
   text("Wave: " + state.waveManager.currentWave, 10, 55);

   // Draw the tower at the mouse position if the player is gonna place one
   if(towerToPlace != null) {
     image(towerToPlace.getImage(), mouseX - 16, mouseY - 16);  
   }
 }
 
 private void checkPan() {
   if(mouseX >= Project.WIDTH - panArea) 
     moveRight = true;
   else 
     moveRight = false;
   if(mouseX <= panArea)
     moveLeft = true;
   else
     moveLeft = false;
   if(mouseY >= Project.HEIGHT - panArea)
     moveDown = true;
   else 
     moveDown = false;
   if(mouseY <= panArea)
     moveUp = true;
   else 
     moveUp = false;
 }
 
 float xChange, yChange;
 private void checkMovement() {
   xChange = 0; yChange = 0;
   if(moveUp)
     yChange -= ySpeed;
   if(moveDown)
     yChange += ySpeed;
   if(moveRight)
     xChange += xSpeed;
   if(moveLeft)
     xChange -= xSpeed;
   
   moveX(xChange);
   moveY(yChange);
 }
 
 private void checkOffset() {
   map.setOffset((int)x - 400, (int)y - 300); 
 }
 
 protected void moveX(float xChange) {  
   // Change player position
   x += xChange;
   
   // Make sure the offset does not go off of the map
   if(x < 512) 
     x = 512;
   else if(x > (map.getWidth() << 5) - 512)
     x = (map.getWidth() << 5) - 512;
   
 }
 protected void moveY(float yChange) {  
   // Change player position
   y += yChange;
   
   // Make sure the offset does not go off of the map
   //if(y < 312)
   if(y < 412)
     y = 412;
   if(y > (map.getHeight() << 5) - 412)
     y = (map.getHeight() << 5) - 412;
 }
 
 
 
 // Setters
 public void addGold(int amount) {
   gold += amount;  
 }
 
 
 // Key Controller
 public void keyPressed(String key) {  
   if(key.equalsIgnoreCase("1")) {
     if(!(towerToPlace instanceof BasicTower)) 
       towerToPlace = new BasicTower(null, state, state.basicTower.getImage());
     else
       towerToPlace = null;
   } 
   else if(key.equalsIgnoreCase("2")) {
     if(!(towerToPlace instanceof SlowTower)) 
       towerToPlace = new SlowTower(null, state, state.slowTower.getImage());  
     else 
       towerToPlace = null;
   }
   else if(key.equalsIgnoreCase("3")) {
     if(!(towerToPlace instanceof PoisonTower))
       towerToPlace = new PoisonTower(null, state, state.poisonTower.getImage());
     else
       towerToPlace = null;
   }
   else if(key.equalsIgnoreCase("4")) {
     if(!(towerToPlace instanceof AmpTower)) {
       towerToPlace = new AmpTower(null, state, state.ampTower.getImage());
     }
     else {
       towerToPlace = null;  
     }
   }
   else if(key.equalsIgnoreCase("5")) {
     if(!(towerToPlace instanceof SnareTower)) {
       towerToPlace = new SnareTower(null, state, state.snareTower.getImage());  
     }
     else {
       towerToPlace = null;  
     }
   }
   else if(key.equalsIgnoreCase("money")) {
     gold += 1000;  
   }
 }
 public void keyReleased(String key) {
   
 }
 
 public void mousePressed() {
   if(towerToPlace != null) {
     // Check to place the tile
     Tile temp = map.getTile(mouseX + map.getXOffset(), mouseY + map.getYOffset());
     if(!temp.getWalkSolid()) {
       // If the player has enough gold and the wave is not in progress
       if(gold >= towerToPlace.getCost() && !state.waveManager.inProgress) {
         towerToPlace.setTile(temp);
         map.addTower((mouseX + map.getXOffset()) >> 5, (mouseY + map.getYOffset()) >> 5, towerToPlace);
         temp = null;
         gold -= towerToPlace.getCost();
       }
       else {
         // Tell the user they do not have enough gold 
       }
       towerToPlace = null;
     }
     else {
       // Make a noise because you can't place a tile in that spot  
     }
   }
 }
 
 
 // Getters
 public int getGold() {
   return gold;  
 }
 
 // Setters
 public void setTowerToPlace(Tower tower) {
   towerToPlace = tower;  
 }
 
}
public class PoisonTower extends Tower {
  
  private float projectileSpeed = 12.3f;
  private int projectileSize = 4;
  private RGB colour = new RGB(0, 203, 0);
  
  // Damage over time
  private int dotDps = 1; // Damage per second overtime
  private int dotLength = 301; // damage over time length + 1
  
  public PoisonTower(Tile tile, GameState state, PImage image) {
    super(tile, state);
    this.image = image;
  }
  
  public void init() {
    cost = 200;
    damage = 2;
    attackSpeed = 30;
    range = 200;
  }
  
  public void update() {
    checkShoot();  
  }
  
  public void render(int xOffset, int yOffset) {
    super.renderTower(xOffset, yOffset);
  }
  
  int current = 0;
  // Checks to see if the tower can attack
  private void checkShoot() {
    current++;
    if(current % attackSpeed == 0) {
      shouldShoot = true;  
    }
    if(shouldShoot) {
      // Perform attacks
      Mob target = null;
      Mob currentTarget = null;
      for(int i = 0; i < state.enemies.size(); i++) {
        currentTarget = state.enemies.get(i);
        if(currentTarget.getHealth() > 0 && Math.abs((tile.x << 5) - currentTarget.getX()) <= range && Math.abs((tile.y << 5) - currentTarget.getY()) <= range) {
          currentTarget.hit(damage);
          //int lifeTime = (int)((Math.abs((currentTarget.getX() - (tile.x << 5))) + Math.abs((currentTarget.getY() - (tile.y << 5)))) / (projectileSpeed * 1.6));
          state.projectiles.add(new Projectile((tile.x << 5) + 15, (tile.y << 5) + 15, currentTarget.getX() + 15, currentTarget.getY() + 15, projectileSpeed, projectileSize, projectileSize, 200, colour, state.getTilemap()));
          currentTarget.dot(dotDps, dotLength);
          shouldShoot = false;
          current = 0;
          break;
        }
      }
      
      // Reset current
      current = 0;
    }
  }
  
}
public class Projectile extends Entity {
 
  private Rectangle destHitbox;
  private Rectangle hitbox;
  private float xSpeed, ySpeed;
  private double angle;
  private float speed;
  private int lifetime, currentLife = 0;
  private Tilemap map;
  
  private RGB colour;
  private PImage image;
  
  public Projectile(float x, float y, float xDest, float yDest, float speed, int width, int height, int lifetime, RGB colour, Tilemap map) {
    super(x, y);
    
    // Initialize the projectile
    this.destHitbox = new Rectangle((int)xDest - width, (int)yDest - height, width * 2, height * 2);
    this.hitbox = new Rectangle((int)x, (int)y, width, height);
    this.lifetime = lifetime;
    this.colour = colour;
    this.map = map;
    angle = Math.atan2(yDest - y, xDest - x);
    xSpeed = (float)(Math.cos(angle) * speed);
    ySpeed = (float)(Math.sin(angle) * speed);
  }
  
  public Projectile(float x, float y, float xDest, float yDest, float speed, int width, int height, int lifetime, PImage image, Tilemap map) {
    super(x, y);
    
    // Initialize the projectile
    this.destHitbox = new Rectangle((int)xDest - 10, (int)yDest - 10, width + 10, height + 10);
    this.hitbox = new Rectangle((int)x, (int)y, width, height);
    this.lifetime = lifetime;
    this.image = image;
    this.map = map;
    angle = Math.atan2(yDest - y, xDest - x);
    xSpeed = (float)(Math.cos(angle) * speed);
    ySpeed = (float)(Math.sin(angle) * speed);
  }
  
  private void update() {
    checkLife();
    move();
  }
  
  private void render(int xOffset, int yOffset) {
    if(image == null) {
      fill(colour.red, colour.green, colour.blue);
       rect(x - xOffset, y - yOffset, hitbox.width, hitbox.height);
    }
    else {
      image(image, x - xOffset, y - yOffset);  
    }
  }
  
  private void move() {
    x += xSpeed;
    y += ySpeed;
    
    hitbox.x = (int)x;
    hitbox.y = (int)y;
    
    // Check to see if the destHitbox was reached
    if(destHitbox.intersects(hitbox) || destHitbox.contains(hitbox))
      shouldRemove = true;
  }
  
  
  private void checkLife() {
    if(currentLife >= lifetime) {
      shouldRemove = true; 
    }
    currentLife++;
  }
  
  
  // Getters
  public Rectangle getHitbox() {
    return hitbox; 
  }
  
}
public class RGB {
  
  public int red, green, blue;
  
  public RGB(int red, int green, int blue) {
    if(red >= 0 && red <= 255 && green >= 0 && green <= 255 && blue >= 0 && blue <= 255) {
      this.red = red;
      this.green = green;
      this.blue = blue;
    }
    else {
      System.out.println("ERROR OCCURRED IN RGB CONSTRUCTOR");
      System.exit(1);
    }
  }
  
}
public class SlowTower extends Tower {
  
  private float projectileSpeed = 12.3f;
  private int projectileSize = 4;
  private RGB colour = new RGB(0, 0, 204);
  
  private float slowingPower = 0.5f;
  private int slowLength = 240;
  
  public SlowTower(Tile tile, GameState state, PImage image) {
    super(tile, state);
    this.image = image;
  }
  
  public void init() {
    cost = 150;
    damage = 5;
    attackSpeed = 90;
    range = 125;
  }
  
  public void update() {
    checkShoot();  
  }
  
  public void render(int xOffset, int yOffset) {
    super.renderTower(xOffset, yOffset);
  }
  
  int current = 0;
  // Checks to see if the tower can attack
  private void checkShoot() {
    current++;
    if(current % attackSpeed == 0) {
      shouldShoot = true;  
    }
    if(shouldShoot) {
      // Perform attacks
      Mob target = null;
      Mob currentTarget = null;
      for(int i = 0; i < state.enemies.size(); i++) {
        currentTarget = state.enemies.get(i);
        if(currentTarget.getHealth() > 0 && Math.abs((tile.x << 5) - currentTarget.getX()) <= range && Math.abs((tile.y << 5) - currentTarget.getY()) <= range) {
          currentTarget.hit(damage);
          currentTarget.slow(slowingPower, slowLength);
          //int lifeTime = (int)((Math.abs((currentTarget.getX() - (tile.x << 5))) + Math.abs((currentTarget.getY() - (tile.y << 5)))) / (projectileSpeed * 1.6));
          state.projectiles.add(new Projectile((tile.x << 5) + 15, (tile.y << 5) + 15, currentTarget.getX() + 15, currentTarget.getY() + 15, projectileSpeed, projectileSize, projectileSize, 200, colour, state.getTilemap()));
          shouldShoot = false;
          current = 0;
          break;
        }
      }
      
      // Reset current
      current = 0;
    }
  }
  
}
public class SnareTower extends Tower {
  
  private float projectileSpeed = 12.3f;
  private int projectileSize = 4;
  private RGB colour = new RGB(255, 106, 0);
  
  private int snareLength = 75;
  
  public SnareTower(Tile tile, GameState state, PImage image) {
    super(tile, state);
    this.image = image;
  }
  
  public void init() {
    cost = 250;
    damage = 3;
    attackSpeed = 180;
    range = 150;
  }
  
  public void update() {
    checkShoot();  
  }
  
  public void render(int xOffset, int yOffset) {
    super.renderTower(xOffset, yOffset);
  }
  
  int current = 0;
  // Checks to see if the tower can attack
  private void checkShoot() {
    current++;
    if(current % attackSpeed == 0) {
      shouldShoot = true;  
    }
    if(shouldShoot) {
      // Perform attacks
      Mob target = null;
      Mob currentTarget = null;
      for(int i = 0; i < state.enemies.size(); i++) {
        currentTarget = state.enemies.get(i);
        if(currentTarget.getHealth() > 0 && Math.abs((tile.x << 5) - currentTarget.getX()) <= range && Math.abs((tile.y << 5) - currentTarget.getY()) <= range) {
          currentTarget.hit(damage);
          currentTarget.snare(snareLength);
          //int lifeTime = (int)((Math.abs((currentTarget.getX() - (tile.x << 5))) + Math.abs((currentTarget.getY() - (tile.y << 5)))) / (projectileSpeed * 1.6));
          state.projectiles.add(new Projectile((tile.x << 5) + 15, (tile.y << 5) + 15, currentTarget.getX() + 15, currentTarget.getY() + 15, projectileSpeed, projectileSize, projectileSize, 200, colour, state.getTilemap()));
          shouldShoot = false;
          current = 0;
          break;
        }
      }
      
      // Reset current
      current = 0;
    }
  }
  
}
public enum Type {
  PARTICLE;
}

public class Spawner {
  
  public Spawner(Type type, float x, float y, float xSpeed, float ySpeed, RGB colour, int life, int width, int height, int amount, RenderType renderType, GameState state) {
    if(type == Type.PARTICLE) {
      for(int i = 0; i < amount; i++) {
         state.addParticle(new Particle(x, y, xSpeed, ySpeed, width, height, life, colour, renderType));
      }
    }
  }
  
}
public class Speeder extends Mob {
  
  public Spritesheet sheet = new Spritesheet("goblins.png", 27, 27);
  public Sprite[][] anim = {{new Sprite(1, 0, sheet), new Sprite(0, 0, sheet), new Sprite(2, 0, sheet)},
                            {new Sprite(1, 3, sheet), new Sprite(0, 3, sheet), new Sprite(2, 3, sheet)},
                            {new Sprite(1, 2, sheet), new Sprite(0, 2, sheet), new Sprite(2, 2, sheet)},
                            {new Sprite(1, 1, sheet), new Sprite(0, 1, sheet), new Sprite(2, 1, sheet)}};
  
  private int currentSet = 0; // current set of sprites currently being rendered ( 0=down, 1=up, 2=right, 3=left )
  private int currentSprite = 1; // current sprite being rendered ( 0=idle, 1=move1, 2=move2 )
  public final int animSpeed = 25; // Lower the int, the faster the animation
  private boolean moveUp, moveDown, moveRight, moveLeft;
  
  private Stack<Node> pathing;
  private Node currentGoal;
  
  public Speeder(float x, float y, Tilemap map, Stack<Node> pathing) {
    super(x, y, map);
    this.pathing = pathing;
    currentGoal = pathing.pop();
  }
  
  public void init() {
    // Statistics
    health = 200; 
    maxHealth = health;
    xSpeed = 4.6f;
    ySpeed = 4.6f; 
    width = 16;
    height = 16;
    worth = 25;
    damage = 1;
  }
  
  public void update() {
    super.checkSlow();
    super.checkDot();
    super.checkAmp();
    super.checkSnare();
    move();  
    checkLife();
  }
  
  private int counter = 0;
  public void render(int xOffset, int yOffset) {
    if(moveUp) {
      currentSet = 1;
    }
    else if(moveDown) {
      currentSet = 0;
    }
    if(moveRight) {
      currentSet = 2;
    }
    else if(moveLeft) {
      currentSet = 3;
    }
    
    if(shouldShow) {
      image(anim[currentSet][currentSprite].getImage(), x - xOffset + 2, y - yOffset + 2);
      super.renderHealth(xOffset, yOffset);
    }
    
    if(!snared) {
      // Animate the sprite
      counter++;
      if(counter >= animSpeed) {
        counter = 0;
        currentSprite++;
        if(currentSprite >= 3) 
          currentSprite = 1;
      }
    }
  }

  
  
  private void move() {
    if(!snared) {
      // Check previous movement and change sprite depending on direction
      float prevX = x, prevY = y;
      moveUp = false;
      moveDown = false;
      moveRight = false;
      moveLeft = false;
      
      
      // Move towards current goal
      if((currentGoal.x << 5) > x) {
        x += xSpeed;
      }
      if((currentGoal.x) << 5 < x) {
        x -= xSpeed;
      }
      if((currentGoal.y << 5) > y) {
        y += ySpeed;
      }
      if((currentGoal.y << 5) < y) {
        y -= ySpeed;
      }
      
      // Check previous movement and change sprite depending on direction
      if(x > prevX) 
        moveRight = true;
      else if(x < prevX)
        moveLeft = true;
      else if(y > prevY) 
        moveDown = true;
      else if(y < prevY)
        moveUp = true;
        
      // Check if the goal was basically reached
      if(Math.abs((currentGoal.x << 5) - x) < 6 && Math.abs((currentGoal.y << 5) - y) < 6)
        currentGoal = pathing.pop();
        
      // Checks to see if the unit is approaching the castle
      if(((int)x >> 5) < 19)
        shouldRemove = true;
    }
  }
  
  private void checkLife() {
    if(health <= 0) {
      shouldRemove = true;
      map.getState().getPlayer().addGold(worth);
    }
  }
}
public class Sprite {
  
  private Spritesheet sheet;
  private PImage sprite;
  private String path;
  private int x, y;
  
  public Sprite(int x, int y, Spritesheet sheet) {
    this.x = x;
    this.y = y;
    this.sheet = sheet;
    
    load();
  }
  
  public Sprite(String path) {
    sprite = loadImage(path);
  }
  
  private void load() {
    sprite = sheet.getImage().get(x * sheet.getSpriteWidth(), y * sheet.getSpriteHeight(), sheet.getSpriteWidth(), sheet.getSpriteHeight());
  }
  
  
  // Getters
  public PImage getImage() {
    return sprite; 
  }
  
  public int getWidth() {
    if(sheet == null) {
      return sprite.width;
    }
    else {
      return sheet.getSpriteWidth();  
    }
  }
  public int getHeight() {
    if(sheet == null) {
      return sprite.height;
    }
    else {
      return sheet.getSpriteHeight();  
    }
  }
  
}
public class Spritesheet {
  
  private String path;
  private int width, height;
  private int spriteWidth, spriteHeight;
  private PImage sheet;
  
  public Spritesheet(String path, int spriteWidth, int spriteHeight) {
    this.path = path;
    this.spriteWidth = spriteWidth;
    this.spriteHeight = spriteHeight;
    
    load();
  }
  
  private void load() {
    sheet = loadImage(path);
    width = sheet.width;
    height = sheet.height;
  }
  
  // Getters
  public int getWidth() {
    return width; 
  }
  public int getHeight() {
    return height; 
  }
  public int getSpriteWidth() {
    return spriteWidth; 
  }
  public int getSpriteHeight() {
    return spriteHeight;
  }
  public PImage getImage() {
    return sheet; 
  }
}
public abstract class Tile {
  
  public static final int TILESIZE = 32;
  
  protected int x, y;
  protected PImage image;
  protected boolean walkSolid, projectileSolid;
  protected Tower tower;
  
  public Tile(int x, int y, PImage image) {
    this.x = x;
    this.y = y;
    this.image = image;
    
    init();
  }
  
  public abstract void init();
  public abstract void update();
  public abstract void render(int xOffset, int yOffset);
  
  //Setters
  public void setTower(Tower tower) {
    this.tower = tower; 
    // Flips the bit
    walkSolid = true;
  }
  
  //Getters
  public int getX() {
    return x; 
  }
  public int getY() {
    return y; 
  }
  public PImage getImage() {
    return image; 
  }
  public boolean getWalkSolid() {
    return walkSolid;  
  }
  public boolean getProjectileSolid() {
    return projectileSolid;
  }
  public Tower getTower() {
    return tower;  
  }
  
}




public class Tilemap {
  
  private GameState state;
  private PImage map;
  private int width, height;
  private String path;
  private Tile[][] tiles;
  
  private int[] pixels;
  
  private int xOffset, yOffset;
  
  public Tilemap(String path, int xOffset, int yOffset, GameState state) {
    this.path = path;
    this.xOffset = xOffset;
    this.yOffset = yOffset;
    this.state = state;
    
    load();
  }
  
  private void load() {  
    map = loadImage(path);
    width = map.width;
    height = map.height;
    tiles = new Tile[height][width];
    map.loadPixels();
    pixels = map.pixels;
    
    // Load tiles
    int loc;
    int colorCode;
    for(int y = 0; y < height; y++) {
      for(int x = 0; x < width; x++) {
        loc = x + y * width;
        colorCode = pixels[loc];
        Tile toPlace = null;
        switch(colorCode) {
          case 0xFF404040:
            toPlace = new InterchangeableFloorTile(x, y, state.castleFloor.getImage());
            break;
          case 0xFF0026FF:
            toPlace = new WaterTile(x, y, state.water.getImage());
            break;
          case 0xFF00FF21:
            toPlace = new InterchangeableFloorTile(x, y, state.grass.getImage());
            break;
          case 0xFFFFAA00:
            toPlace = new InterchangeableFloorTile(x, y, state.sand.getImage());
            break;
          case 0xFF602600:
            toPlace = new InterchangeableFloorTile(x, y, state.wood.getImage());
            break;
        }
        tiles[y][x] = toPlace;
      }
    }
  }
  
  public void update() {
    for(int y = 0; y < height; y++) {
      for(int x = 0; x < width; x++) {
        tiles[y][x].update(); 
      }
    }
  }
  
  public void render() {
    for(int y = (yOffset >> 5) - 1; y < ((yOffset + Project.HEIGHT) >> 5) + 1; y++) {
      for(int x = (xOffset >> 5) - 1; x < ((xOffset + Project.WIDTH) >> 5) + 1; x++) {
        tiles[y][x].render(xOffset, yOffset);
      }
    }
  }
  
  public void destroyRandomTower() {
    for(int y = 0; y < height; y++) {
      for(int x = 0; x < width; x++) {
        if(tiles[y][x].getTower() != null) {
          tiles[y][x].setTower(null);
          return; // return after destroying the first tower encountered
        }
      }
    }
  }
  
  // Tile precision
  public void changeTile(int x, int y, Tile tile) {
    tiles[y][x] = tile; 
  }
  // Tile precision
  public void addTower(int x, int y, Tower tower) {
    tiles[y][x].setTower(tower);  
  }
  // Tile precision
  public void removeTower(int x, int y) {
    tiles[y][x].setTower(null);  
    tiles[y][x].walkSolid = false;
  }
  
  // Getters
  public int getXOffset() {
    return xOffset; 
  }
  public int getYOffset() {
    return yOffset; 
  }
  public int[] getPixels() {
    return pixels; 
  }
  public Tile[][] getTiles() {
    return tiles; 
  }
  public int getWidth() {
    return width; 
  }
  public int getHeight() {
    return height; 
  }
  public GameState getState() {
    return state;  
  }
  
  // Pass in pixel precision
  public Tile getTile(int x, int y) {
    return tiles[y >> 5][x >> 5]; 
  }
  
  // Setters
  public void setXOffset(int newOffset) {
    xOffset = newOffset;
  }
  public void setYOffset(int newOffset) {
    yOffset = newOffset; 
  }
  public void setOffset(int xOffset, int yOffset) {
    this.xOffset = xOffset;
    this.yOffset = yOffset;
  }
  public void addOffset(int xOffset, int yOffset) {
    this.xOffset += xOffset;
    this.yOffset += yOffset;
  }
  
  // Float Setters
  private float bufferX = 0;
  private float bufferY = 0;
  public void addOffset(float xOffset, float yOffset) {
    bufferX += xOffset;
    bufferY += yOffset;
    
    // Round the buffer
    int newBufferX = Math.round(bufferX);
    int newBufferY = Math.round(bufferY);
    
    // Add the rounded number
    addOffset((int)newBufferX, (int)newBufferY);
    
    bufferX -= newBufferX;
    bufferY -= newBufferY;
  }
  
}
public abstract class Tower {
  
  public PImage image;
  protected int cost;
  protected int damage;
  protected int attackSpeed;
  protected int range;
  protected boolean shouldShoot;
  
  protected Tile tile;
  protected GameState state;
  
  protected boolean showRange; // NOTICE: Does not work due to how the tiles are rendered
  
  public Tower(Tile tile, GameState state) {
    this.tile = tile;
    this.state = state;
    
    init();
  }
  
  public abstract void init();
  
  public abstract void update();
  public abstract void render(int xOffset, int yOffset);
  
  public void renderTower(int xOffset, int yOffset) {
    if(image != null) {
      image(image, (tile.getX() << 5) - xOffset, (tile.getY() << 5) - yOffset);
    }
  }
  
  public void renderRange(int xOffset, int yOffset) {
    if(showRange) {
      line((tile.getX() << 5) - range - xOffset, (tile.getY() << 5) - range - yOffset, (tile.getX() << 5) + range - xOffset, (tile.getY() << 5) - range - yOffset);
      line((tile.getX() << 5) - range - xOffset, (tile.getY() << 5) + range - yOffset, (tile.getX() << 5) + range - xOffset, (tile.getY() << 5) + range - yOffset);
      line((tile.getX() << 5) - range - xOffset, (tile.getY() << 5) - range - yOffset, (tile.getX() << 5) - range - xOffset, (tile.getY() << 5) + range - yOffset);
      line((tile.getX() << 5) + range - xOffset, (tile.getY() << 5) - range - yOffset, (tile.getX() << 5) + range - xOffset, (tile.getY() << 5) + range - yOffset);
    }  
  }
  
  
  // Setters
  public void setTile(Tile tile) {
    this.tile = tile;  
  }
  public void setShowRange(boolean decide) {
    showRange = decide;  
  }
  
  
  // Getters
  public Tile getTile() {
    return tile;  
  }
  public int getCost() {
    return cost;  
  }
  public float getDamage() {
    return damage;  
  }
  public float getAttackSpeed() {
    return attackSpeed;  
  }
  public int getRange() {
    return range;  
  }
  public PImage getImage() {
    return image;  
  }
  
}
public abstract class UIElement {
      
     protected float x;
     protected float y;
    

     // When and if we have sprites
     public UIElement(float x, float y) {
         this.x = x;
         this.y = y;
     }
     
     public abstract void render();
}

/* --------------Buttons----------------- */
public abstract class UIButton extends UIElement {
  
   protected float radius = 35.0f;
   protected PImage image;
   protected int[] rgb;
   protected int hotkey; // Used as a shortcut instead of clicking the tower (ie. hitting '3' instead of clicking the button)
    
  
   // When and if we have sprites
   public UIButton(float x, float y, PImage image, int hotkey) {
       super(x, y);
       this.image = image;
       this.hotkey = hotkey;
   }
   
   public UIButton(float x, float y, int[] rgb, int hotkey) {
       super(x, y);
       this.rgb = rgb;
       this.hotkey = hotkey;
   }
   
   public boolean isMouseInside() {
      if (x < mouseX && mouseX < x + radius && y < mouseY && mouseY < y + radius) {
         return true; 
      }
      return false;
   }
   
   public abstract void inside();
  
   public abstract void click();
   
   // Setters
   public void setHotkey(int num) {
     hotkey = num;
   }
   
   // Getters
   public int getHotkey() {
     return hotkey;  
   }
}

public class TowerPurchaseButton extends UIButton {
    //UI
    public Sprite towerDescriptionUI = new Sprite("towerInfoUI.png");
    
    // Hotkey display font
    PFont font = createFont("Gothic.ttf", 24, true);  
    private String info;
    private float infoUIX, infoUIY;
  
    public TowerPurchaseButton(float x, float y, int[] rgb, int hotkey, String info, float infoUIX, float infoUIY) {
        super(x, y, rgb, hotkey);
        this.info = info;
        this.infoUIX = infoUIX;
        this.infoUIY = infoUIY;
    }
    public TowerPurchaseButton(float x, float y, PImage image, int hotkey, String info, float infoUIX, float infoUIY) {
      super(x, y, image, hotkey);  
      this.info = info;
      this.infoUIX = infoUIX;
      this.infoUIY = infoUIY;
    }
    
    public void render() {
      if(image == null) {
        fill(rgb[0], rgb[1], rgb[2]);  
        ellipse(x, y, radius, radius);
      }
      else {
        image(image, x, y);    
        fill(255, 0, 0);
        textFont(font);
        fill(0, 0, 0);
        text(hotkey, x + radius / 2 - 7, y + 56);
      }
    }
    
    public void inside() {
      fill(125, 2, 88);
      image(towerDescriptionUI.getImage(), infoUIX, infoUIY);
      text(info, 185, y - 200);
    }
    
    public void click() {
      
    }
}
/* --------------End Buttons----------------- */
public class WaterTile extends Tile {
  
  public WaterTile(int x, int y, PImage image) {
    super(x, y, image);
  }
  
  public void init() {
    projectileSolid = false;
    walkSolid = true;
  }
  
  public void update() {
    
  }
  
  public void render(int xOffset, int yOffset) {
    image(image, (x << 5) - xOffset, (y << 5) - yOffset);
  }
  
}
public class WaveManager {
  
  private PFont font;
  private LevelOneState state;
  private int xSpawn, ySpawn;
  public boolean inProgress;
  public int currentWave = 0;
  
  // Adjustable stats
  private final int betweenWaveTimer = 1800;
  private int currentWaveTimer = betweenWaveTimer;
  private boolean roundEnding;
  
  private int ticksIntoWave = 0;
  
  private int frequency = 120; 
  
  private int waveLength = 1800; 
  
  private int waveReward = 100;
  
  public WaveManager(int x, int y, LevelOneState state) {
    this.state = state;
    this.xSpawn = x;
    this.ySpawn = y;
    
    font = createFont("Gothic.ttf", 24, true);
  }
  public void update() {
    // If the wave is not in progress, then keep the timer going
    if(!inProgress) {
      currentWaveTimer--;
      if(currentWaveTimer <= 0) {
        inProgress = true;
        currentWaveTimer = betweenWaveTimer;
        currentWave++;
        state.calculateAIPath(74, 17);
        roundEnding = false;
      }
    }
    else {
      ticksIntoWave++;
      // Else the game is in progress
      if(ticksIntoWave % frequency == 0 && !roundEnding) {
        // Set waves spawns
        if(currentWave == 1) {
          if(ticksIntoWave == frequency) {
            state.getGSM().getStates().push(new InfoState(state.getGSM(), EnemyType.SLIME));
          }
          state.enemies.add(new Grunt(32 * 74, 32 * 17, state.getTilemap(), (Stack<Node>)state.pathing.clone()));
        }
        else if(currentWave == 2) {
          if(ticksIntoWave == frequency) {
            state.getGSM().getStates().push(new InfoState(state.getGSM(), EnemyType.GOBLIN));
          }
          state.enemies.add(new Speeder(32 * 74, 32 * 17, state.getTilemap(), (Stack<Node>)state.pathing.clone()));
        }
        else if(currentWave == 3) {
          if(ticksIntoWave == frequency) {
            state.getGSM().getStates().push(new InfoState(state.getGSM(), EnemyType.PHOENIX));
          }
          state.enemies.add(new Flyer(32 * 95, 32 * 17, state.getTilemap())); 
        }
        else if(currentWave == 4) {
          if(Math.random() * 3 <= 1) {
            state.enemies.add(new Speeder(32 * 74, 32 * 17, state.getTilemap(), (Stack<Node>)state.pathing.clone()));
          }
          if(Math.random() * 3 <= 1) {
            state.enemies.add(new Flyer(32 * 95, 32 * 17, state.getTilemap())); 
          }
          if(Math.random()* 3 <= 1) {
            state.enemies.add(new Grunt(32 * 74, 32 * 17, state.getTilemap(), (Stack<Node>)state.pathing.clone()));
          }
        }
        else if(currentWave == 5) { // Kronos Wave
          if(ticksIntoWave == frequency) {
            state.getGSM().getStates().push(new InfoState(state.getGSM(), EnemyType.KRONOS));
            frequency = 1;
            state.enemies.add(new Kronos(32 * 74, 32 * 17, state.getTilemap(), (Stack<Node>)state.pathing.clone()));
          }
          // Check to see if Kronos casted flash
          for(int i = 0; i < state.enemies.size(); i++) {
            if(state.enemies.get(i) instanceof Kronos) {
              Kronos boss = (Kronos)state.enemies.get(i);
              if(boss.flash) {
                state.flash = true;
                boss.flash = false;
              }
            }
          }
        }
      }
      
      if(ticksIntoWave >= waveLength) roundEnding = true;
      if(ticksIntoWave >= waveLength && state.enemies.size() == 0) {
        ticksIntoWave = 0;
        inProgress = false;
        state.getPlayer().addGold(waveReward);
        
        // Set next waves variables
        if(currentWave == 1) { // round 2
          frequency = 90;   
          waveReward = 200;
          waveLength = 1800;  
        }
        else if(currentWave == 2) { //round 3
          frequency = 100;
          waveReward = 200;
          waveLength = 1005; 
        }
        else if(currentWave == 3) { //round 4 
          frequency = 70;
          waveReward = 200;
          waveLength = 1800; 
        }
        else if(currentWave == 4) { //round 5
          frequency = 100;
          waveReward = 500;
          waveLength = 400;
        }
        else if(currentWave == 5) { //round 6
          state.getGSM().getStates().pop();
          state.getGSM().getStates().push(new MenuState(state.getGSM()));
        }
      }
    }
  }
  
  public void render() {
    // If the wave is not in progress, keep the user up to date when it will start
    if(!inProgress) {
      fill(125, 2, 88);
      textFont(font);
      
      text((currentWaveTimer/60 + 1) + " seconds until next wave", 275, 150);
    }
  }
  
  public void keyPressed(String k) {
    if(k.equalsIgnoreCase("begin")) {
      if(!inProgress) {
        currentWaveTimer = 1;
      }
    }
  }
  
}
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Project" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
