import java.awt.Rectangle;

public abstract class Mob extends Entity {
  
  protected Rectangle hitbox;
  protected Tilemap map;
  protected int maxHealth;
  protected int health;
  protected float xSpeed, ySpeed;
  protected int width, height;
  public boolean shouldShow = true;
  protected int worth;
  protected int damage;
  
  public boolean slowed;
  public int slowLength;
  public float slowPower;
  
  public boolean poisoned;
  public int dotLength;
  public int dotDps;
  
  public int ampLength;
  public int ampPower;
  public boolean amped;
  
  public boolean snared;
  public int snareLength;
  
  public Mob(float x, float y, Tilemap map) {
    super(x, y);
    this.map = map;
    
    init();
  }
  
  protected void moveX(float xChange) {
    if(!snared) {
      if(map.getTile((int)(x + xChange), (int)y).getWalkSolid()) {
        return;  
      }
      
      // Change player position
      x += xChange;  
    }
  }
  protected void moveY(float yChange) {  
    if(!snared) {
      if(map.getTile((int)x, (int)(y + yChange)).getWalkSolid()) {
        return;  
      }
      
      // Change player position
      y += yChange;
    }
  }
  protected void updateHitbox() {
    hitbox.x = (int)x;
    hitbox.y = (int)y;
  }
  
  public abstract void init();
  public abstract void update();
  public abstract void render(int xOffset, int yOffset);
  
  protected void renderHealth(int xOffset, int yOffset) {
    // Fill the background (red)
    fill(255, 0, 0);
    rect(x - xOffset, y - 12 - yOffset, 32, 8);
    
    // Fill how much health you are missing (green)
    fill(0, 255, 0);
    rect(x - xOffset, y - 12 - yOffset, (health / (float)maxHealth) * 32, 8);
  }
  
  public void hit(int damage) {
    health -= (damage + ampPower);  
  }
  
  public void snare(int snareLength) {
    if(!(this.snareLength > snareLength)) { 
      this.snareLength = snareLength;
      snared = true;
    }
  }
  
  public void slow(float slowPower, int slowLength) {
    // Check to see if the unit is already slowed, if it is, just add more time onto the slow
    if(slowed) {
      this.slowLength += slowLength;
    }
    else {
      slowed = true;
      this.slowLength = slowLength;
      this.slowPower = slowPower;
      
      xSpeed *= slowPower;
      ySpeed *= slowPower;
    }
  }
  
  // Amplifies the damage, that a unit will take
  public void amp(int ampLength, int ampPower) {
    if(amped) {
      this.ampLength += ampLength;  
      if(this.ampPower < ampPower) {
        this.ampPower = ampPower;  
      }
    }
    else {
      amped = true;
      this.ampLength = ampLength;
      this.ampPower = ampPower;
    }
  }
  
  public void dot(int dotDps, int dotLength) {
    this.dotDps += dotDps;
    this.dotLength += dotLength;
    poisoned = true;
  }
  
  protected void checkDot() {
    if(poisoned) {
      dotLength--;
      
      // dot damage
      if(dotLength % 60 == 0) {
        hit(dotDps);
      }
      if(dotLength <= 0) {
        poisoned = false;  
      }
    }
  }
  
  protected void checkSlow() {
    if(slowed) {
      slowLength--;
      if(slowLength <= 0) {
        slowed = false;
        
        // Multiply the speeds by the reciprocal
        xSpeed *= (1/slowPower);
        ySpeed *= (1/slowPower);
      }
    }
  }
  
  protected void checkAmp() {
    if(amped) {
      ampLength--;
      if(ampLength <= 0) {
        amped = false;
        ampPower = 0;
      }
    }
  }
  
  protected void checkSnare() {
    if(snared) {
      snareLength--;
      if(snareLength <= 0) {
         snared = false; 
      }
    }
  }
  
  public void checkDead() {
    if(health <= 0) {
      shouldRemove = true;  
    }
  }
  
  // Getters
  public Rectangle getHitbox() {
    return hitbox; 
  }
  public int getHealth() {
    return health; 
  }
  public Tilemap getMap() {
    return map; 
  }
  
}