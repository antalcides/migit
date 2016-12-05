public class Speeder extends Mob {
  
  public Spritesheet sheet = new Spritesheet("goblins.png", 27, 27);
  public Sprite[][] anim = {{new Sprite(1, 0, sheet), new Sprite(0, 0, sheet), new Sprite(2, 0, sheet)},
                            {new Sprite(1, 3, sheet), new Sprite(0, 3, sheet), new Sprite(2, 3, sheet)},
                            {new Sprite(1, 2, sheet), new Sprite(0, 2, sheet), new Sprite(2, 2, sheet)},
                            {new Sprite(1, 1, sheet), new Sprite(0, 1, sheet), new Sprite(2, 1, sheet)}};
  
  private int currentSet = 0; // current set of sprites currently being rendered ( 0=down, 1=up, 2=right, 3=left )
  private int currentSprite = 1; // current sprite being rendered ( 0=idle, 1=move1, 2=move2 )
  public final int animSpeed = 25; // Lower the int, the faster the animation
  private boolean moveUp, moveDown, moveRight, moveLeft;
  
  private Stack<Node> pathing;
  private Node currentGoal;
  
  public Speeder(float x, float y, Tilemap map, Stack<Node> pathing) {
    super(x, y, map);
    this.pathing = pathing;
    currentGoal = pathing.pop();
  }
  
  public void init() {
    // Statistics
    health = 200; 
    maxHealth = health;
    xSpeed = 4.6f;
    ySpeed = 4.6f; 
    width = 16;
    height = 16;
    worth = 25;
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
    if(moveUp) {
      currentSet = 1;
    }
    else if(moveDown) {
      currentSet = 0;
    }
    if(moveRight) {
      currentSet = 2;
    }
    else if(moveLeft) {
      currentSet = 3;
    }
    
    if(shouldShow) {
      image(anim[currentSet][currentSprite].getImage(), x - xOffset + 2, y - yOffset + 2);
      super.renderHealth(xOffset, yOffset);
    }
    
    if(!snared) {
      // Animate the sprite
      counter++;
      if(counter >= animSpeed) {
        counter = 0;
        currentSprite++;
        if(currentSprite >= 3) 
          currentSprite = 1;
      }
    }
  }

  
  
  private void move() {
    if(!snared) {
      // Check previous movement and change sprite depending on direction
      float prevX = x, prevY = y;
      moveUp = false;
      moveDown = false;
      moveRight = false;
      moveLeft = false;
      
      
      // Move towards current goal
      if((currentGoal.x << 5) > x) {
        x += xSpeed;
      }
      if((currentGoal.x) << 5 < x) {
        x -= xSpeed;
      }
      if((currentGoal.y << 5) > y) {
        y += ySpeed;
      }
      if((currentGoal.y << 5) < y) {
        y -= ySpeed;
      }
      
      // Check previous movement and change sprite depending on direction
      if(x > prevX) 
        moveRight = true;
      else if(x < prevX)
        moveLeft = true;
      else if(y > prevY) 
        moveDown = true;
      else if(y < prevY)
        moveUp = true;
        
      // Check if the goal was basically reached
      if(Math.abs((currentGoal.x << 5) - x) < 6 && Math.abs((currentGoal.y << 5) - y) < 6)
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