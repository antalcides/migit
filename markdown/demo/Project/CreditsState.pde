public class CreditsState extends GameState {
  
  private PFont font1, font2;
  private float currentY;
  
  public CreditsState(GameStateManager gsm) {
    super(gsm); 
  }
  
  public void init() {
    font1 = createFont("Gothic.ttf", 64, true);
    font2 = createFont("Gothic.ttf", 26, true);
    currentY = 600;
  }
  
  public void update() {
    currentY -= 1.1;
    if(currentY <= -260)
      currentY = 600;
  }

  public void render() {
    fill(0);
    rect(0, 0, Project.WIDTH, Project.HEIGHT);
    
    textFont(font1);
    fill(255, 0, 0);
    text("Back", 590 - (4 * 13), 550);
    
    // render text
    textFont(font2);
    text("Developed and Designed By:", 25, 20 + currentY);
    text("Brady Jessup", 50, 120 + currentY);
    text("Cole Traynor", 50, 220 + currentY);
  }
  
  
  public void keyPressed(String key) {
    if(key.equalsIgnoreCase("enter")) 
      gsm.getStates().pop();
  }
  public void keyReleased(String key) {
    
  }
  
  public void mousePressed() {
    
  }
  public void mouseDragged() {
    
  }
  public void mouseReleased() {
    
  }
}