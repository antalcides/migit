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