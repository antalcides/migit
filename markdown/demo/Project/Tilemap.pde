import javax.imageio.ImageIO;
import java.io.IOException;
import java.awt.image.BufferedImage;

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