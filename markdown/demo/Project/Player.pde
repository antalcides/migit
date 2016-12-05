public class Player extends Mob {
 
 // Camera controls
 private float panSpeed = 4.1f;
 private int panArea = 25;
 private boolean moveUp, moveDown, moveRight, moveLeft; 
 private PFont font;
 private LevelOneState state;
 
 private Tower towerToPlace; // The tower that the player currently clicked on to place (will be null must of the time)
 private Tower focusedTower; // The tower the player is looking at (will be null most of the time)
 
 private int gold;
  
 public Player(float x, float y, LevelOneState state) {
   super(x, y, state.getTilemap());
   this.state = state;
   
   init();
 }
 
 // Test
 public void init() {
   gold = 2500; 
   xSpeed = panSpeed;
   ySpeed = xSpeed / 4 * 3;
   font = createFont("Gothic.ttf", 24, true);
   /*health = 100;
   width = 32;
   height = 32;
   hitbox = new Rectangle((int)x, (int)y, width, height);*/
 }
 
 public void update() {
   checkPan();
   checkMovement();
   checkOffset();   
 }
 
 public void render(int xOffset, int yOffset) {
   // Draw how much gold the player has
   textFont(font);
   fill(125, 2, 88);
   text("Gold: " + gold, 10, 25);
   
   // Draw what wave the player is on
   text("Wave: " + state.waveManager.currentWave, 10, 55);

   // Draw the tower at the mouse position if the player is gonna place one
   if(towerToPlace != null) {
     image(towerToPlace.getImage(), mouseX - 16, mouseY - 16);  
   }
 }
 
 private void checkPan() {
   if(mouseX >= Project.WIDTH - panArea) 
     moveRight = true;
   else 
     moveRight = false;
   if(mouseX <= panArea)
     moveLeft = true;
   else
     moveLeft = false;
   if(mouseY >= Project.HEIGHT - panArea)
     moveDown = true;
   else 
     moveDown = false;
   if(mouseY <= panArea)
     moveUp = true;
   else 
     moveUp = false;
 }
 
 float xChange, yChange;
 private void checkMovement() {
   xChange = 0; yChange = 0;
   if(moveUp)
     yChange -= ySpeed;
   if(moveDown)
     yChange += ySpeed;
   if(moveRight)
     xChange += xSpeed;
   if(moveLeft)
     xChange -= xSpeed;
   
   moveX(xChange);
   moveY(yChange);
 }
 
 private void checkOffset() {
   map.setOffset((int)x - 400, (int)y - 300); 
 }
 
 protected void moveX(float xChange) {  
   // Change player position
   x += xChange;
   
   // Make sure the offset does not go off of the map
   if(x < 512) 
     x = 512;
   else if(x > (map.getWidth() << 5) - 512)
     x = (map.getWidth() << 5) - 512;
   
 }
 protected void moveY(float yChange) {  
   // Change player position
   y += yChange;
   
   // Make sure the offset does not go off of the map
   //if(y < 312)
   if(y < 412)
     y = 412;
   if(y > (map.getHeight() << 5) - 412)
     y = (map.getHeight() << 5) - 412;
 }
 
 
 
 // Setters
 public void addGold(int amount) {
   gold += amount;  
 }
 
 
 // Key Controller
 public void keyPressed(String key) {  
   if(key.equalsIgnoreCase("1")) {
     if(!(towerToPlace instanceof BasicTower)) 
       towerToPlace = new BasicTower(null, state, state.basicTower.getImage());
     else
       towerToPlace = null;
   } 
   else if(key.equalsIgnoreCase("2")) {
     if(!(towerToPlace instanceof SlowTower)) 
       towerToPlace = new SlowTower(null, state, state.slowTower.getImage());  
     else 
       towerToPlace = null;
   }
   else if(key.equalsIgnoreCase("3")) {
     if(!(towerToPlace instanceof PoisonTower))
       towerToPlace = new PoisonTower(null, state, state.poisonTower.getImage());
     else
       towerToPlace = null;
   }
   else if(key.equalsIgnoreCase("4")) {
     if(!(towerToPlace instanceof AmpTower)) {
       towerToPlace = new AmpTower(null, state, state.ampTower.getImage());
     }
     else {
       towerToPlace = null;  
     }
   }
   else if(key.equalsIgnoreCase("5")) {
     if(!(towerToPlace instanceof SnareTower)) {
       towerToPlace = new SnareTower(null, state, state.snareTower.getImage());  
     }
     else {
       towerToPlace = null;  
     }
   }
   else if(key.equalsIgnoreCase("money")) {
     gold += 1000;  
   }
 }
 public void keyReleased(String key) {
   
 }
 
 public void mousePressed() {
   if(towerToPlace != null) {
     // Check to place the tile
     Tile temp = map.getTile(mouseX + map.getXOffset(), mouseY + map.getYOffset());
     if(!temp.getWalkSolid()) {
       // If the player has enough gold and the wave is not in progress
       if(gold >= towerToPlace.getCost() && !state.waveManager.inProgress) {
         towerToPlace.setTile(temp);
         map.addTower((mouseX + map.getXOffset()) >> 5, (mouseY + map.getYOffset()) >> 5, towerToPlace);
         temp = null;
         gold -= towerToPlace.getCost();
       }
       else {
         // Tell the user they do not have enough gold 
       }
       towerToPlace = null;
     }
     else {
       // Make a noise because you can't place a tile in that spot  
     }
   }
 }
 
 
 // Getters
 public int getGold() {
   return gold;  
 }
 
 // Setters
 public void setTowerToPlace(Tower tower) {
   towerToPlace = tower;  
 }
 
}