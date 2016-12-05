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