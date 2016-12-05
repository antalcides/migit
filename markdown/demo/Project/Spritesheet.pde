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