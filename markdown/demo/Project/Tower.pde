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