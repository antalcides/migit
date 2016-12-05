public class Flyer extends Mob {
  
  public Sprite[] anim = {new Sprite("flying1.png"), new Sprite("flying2.png"), new Sprite("flying3.png"), new Sprite("flying4.png")};
  private int currentSprite = 0;
  public final int animSpeed = 7; // Lower the int, the faster the animation
  
  public Flyer(float x, float y, Tilemap map) {
    super(x, y, map);
  }
  
  public void init() {
    // Statistics
    health = 150; 
    maxHealth = health;
    xSpeed = 5f;
    ySpeed = 5f;
    width = 32;
    height = 32;
    worth = 50;
    damage = 1;
  }
  
  public void update() {
    super.checkSlow();
    super.checkDot();
    super.checkAmp();
    super.checkSnare();
    move();  
    checkLife();
  }
  
  private int counter = 0;
  public void render(int xOffset, int yOffset) {
    if(shouldShow) {
      image(anim[currentSprite].getImage(), x - xOffset - 16, y - yOffset - 16, 48, 48);
      super.renderHealth(xOffset, yOffset);
    }
    
    if(!snared) {
      // Animate the sprite
      counter++;
      if(counter >= animSpeed) {
        counter = 0;
        currentSprite++;
        if(currentSprite >= 4) 
          currentSprite = 0;
      }
    }
  }
  
  
  private void move() {
    if(!snared) {
      // Move towards current goal ignoring towers
      x -= xSpeed;
        
      // Checks to see if the unit is approaching the castle
      if(((int)x >> 5) < 19)
        shouldRemove = true;
    }
  }
  
  private void checkLife() {
    if(health <= 0) {
      shouldRemove = true;
      map.getState().getPlayer().addGold(worth);
    }
  }
}