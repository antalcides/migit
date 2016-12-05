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