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