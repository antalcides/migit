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