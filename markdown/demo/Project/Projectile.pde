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