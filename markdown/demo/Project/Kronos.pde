public class Kronos extends Mob {
  
  public Spritesheet sheet = new Spritesheet("Kronos.png", 32, 32);
  public Sprite[][] anim = {{new Sprite(1, 0, sheet), new Sprite(0, 0, sheet), new Sprite(2, 0, sheet)},
                            {new Sprite(1, 3, sheet), new Sprite(0, 3, sheet), new Sprite(2, 3, sheet)},
                            {new Sprite(1, 2, sheet), new Sprite(0, 2, sheet), new Sprite(2, 2, sheet)},
                            {new Sprite(1, 1, sheet), new Sprite(0, 1, sheet), new Sprite(2, 1, sheet)}};
  public Sprite[] lightningAnim = {new Sprite("Lightning1.png"), new Sprite("Lightning2.png"), new Sprite("Lightning3.png"), new Sprite("Lightning4.png"), new Sprite("Lightning5.png")};
  private int currentLightning = 0;
  public boolean flash;
  
  private int currentSet = 0; // current set of sprites currently being rendered ( 0=down, 1=up, 2=right, 3=left )
  private int currentSprite = 1; // current sprite being rendered ( 0=idle, 1=move1, 2=move2 )
  public final int animSpeed = 20; // Lower the int, the faster the animation
  private boolean moveUp, moveDown, moveRight, moveLeft;
  
  private Stack<Node> pathing;
  private Node currentGoal;
  
  // Phase 0 - Prep Phase
  // Phase 1 - Lightning Phase
  // Phase 2 - Movement
  private int phase = 0;
  
  public Kronos(float x, float y, Tilemap map, Stack<Node> pathing) {
    super(x, y, map);
    this.pathing = pathing;
    currentGoal = pathing.pop();
  }
  
  public void init() {
    // Statistics
    health = 2000; 
    maxHealth = health;
    xSpeed = 2.4f;
    ySpeed = 2.4f; 
    width = 32;
    height = 32;
    worth = 500;
    damage = 5;
  }
  
  public void update() {
    super.checkSlow();
    super.checkDot();
    super.checkAmp();
    super.checkSnare();
    checkPhase();
    checkLife();
  }
  
  int prepCounter = 38;
  private void checkPhase() {
    if(phase == 0) {
      currentSprite = 0;
      if(prepCounter == 38) {
        lightningSound.play();  
      }
      prepCounter--;
      if(prepCounter == 0) {
        phase++;  
      }
    }
    else if(phase == 1) {
      lightning();
    }
    else if(phase == 2) {
      move();  
    }
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
    if(phase == 1) {
      currentSprite = 0;
      switch(currentLightning) {
        case 0: image(lightningAnim[0].getImage(), x - xOffset - (lightningAnim[0].getWidth() * 2), y - yOffset - 32, lightningAnim[0].getWidth() * 2, lightningAnim[0].getHeight() * 2);
        break;
        case 1: image(lightningAnim[1].getImage(), x - xOffset - (lightningAnim[1].getWidth() * 2), y - yOffset - 34, lightningAnim[1].getWidth() * 2, lightningAnim[1].getHeight() * 2);
        break;
        case 2: image(lightningAnim[2].getImage(), x - xOffset - (lightningAnim[2].getWidth() * 2), y - yOffset - 29, lightningAnim[2].getWidth() * 2, lightningAnim[2].getHeight() * 2);
        break;
        case 3: image(lightningAnim[3].getImage(), x - xOffset - (lightningAnim[3].getWidth() * 2), y - yOffset - 40, lightningAnim[3].getWidth() * 2, lightningAnim[3].getHeight() * 2);
        break;
        case 4: image(lightningAnim[4].getImage(), x - xOffset - (lightningAnim[4].getWidth() * 2), y - yOffset - 44, lightningAnim[4].getWidth() * 2, lightningAnim[4].getHeight() * 2);
        break;
      }
      if(counter % 13 == 0) {
        currentLightning++;  
        if(currentLightning > 4) {
          phase++;
          currentSprite = 1;
          flash = true;
        }
      }
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

  private void lightning() {
    moveLeft = true;        
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