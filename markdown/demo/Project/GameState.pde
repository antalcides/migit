import java.util.ArrayList;

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