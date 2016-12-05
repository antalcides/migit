public class Grunt extends Mob {
  
  public Sprite[] anim = {new Sprite("grunt1.png"), new Sprite("grunt2.png"), new Sprite("grunt3.png"), new Sprite("grunt4.png")};
  private int currentSprite = 0;
  public final int animSpeed = 12; // Lower the int, the faster the animation
  
  private Stack<Node> pathing;
  private Node currentGoal;
  
  public Grunt(float x, float y, Tilemap map, Stack<Node> pathing) {
    super(x, y, map);
    this.pathing = pathing;
    currentGoal = pathing.pop();
  }
  
  public void init() {
    // Statistics
    health = 200; 
    maxHealth = health;
    xSpeed = 2f;
    ySpeed = 2f;
    width = 32;
    height = 32;
    worth = 25;
    damage = 1;
  }
  
  public void update() {
    super.checkSlow();
    super.checkDot();
    super.checkAmp();
    super.checkSnare();
    if(!snared) {
      move();  
    }
    checkLife();
  }
  
  private int counter = 0;
  public void render(int xOffset, int yOffset) {
    if(shouldShow) {
      image(anim[currentSprite].getImage(), x - xOffset, y - yOffset, 31, 31);
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
      // Move towards current goal
      if((currentGoal.x << 5) > x)
        x += xSpeed;
      if((currentGoal.x) << 5 < x)
        x -= xSpeed;
      if((currentGoal.y << 5) > y)
        y += ySpeed;
      if((currentGoal.y << 5) < y)
        y -= ySpeed;
        
      // Check if the goal was basically reached
      if(Math.abs((currentGoal.x << 5) - x) < 4 && Math.abs((currentGoal.y << 5) - y) < 4)
        currentGoal = pathing.pop();
        
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