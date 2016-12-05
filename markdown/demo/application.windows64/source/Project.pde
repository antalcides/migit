import ddf.minim.*;

private Game game;

private AudioPlayer gameloopSound;
private AudioPlayer lightningSound; 
private Minim minim;//audio context

public static final int WIDTH = 800;
public static final int HEIGHT = 600;

void setup() {
  size(800, 600);
  game = new Game();
  minim = new Minim(this);
  gameloopSound = minim.loadFile("Siege_Loop.mp3", 2048);
  gameloopSound.loop();
  lightningSound = minim.loadFile("Thunder_Sound.wav", 2048);
}

void draw() {
  game.update();
  game.render();
}

// Key Controller
void keyPressed() {
   if(key == 'w' || keyCode == UP)
     game.keyPressed("up");
   else if(key == 's' || keyCode == DOWN)
     game.keyPressed("down");
   else if(key == 'a' || keyCode == LEFT) 
     game.keyPressed("left");
   else if(key == 'd' || keyCode == RIGHT)
     game.keyPressed("right");
   else if(keyCode == ENTER) //escape key
     game.keyPressed("enter");
   else if(key == '1') 
     game.keyPressed("1");
   else if(key == '2')
     game.keyPressed("2");
   else if(key == '3')
     game.keyPressed("3");
   else if(key == '4')
     game.keyPressed("4");
   else if(key == '5')
     game.keyPressed("5");
   else if(key == '6') 
     game.keyPressed("6");
   else if(key == 'b') 
     game.keyPressed("begin");
   else if(key == 'm')
     game.keyPressed("money");
   else if(key == 'h') 
     game.keyPressed("heal");
}
void keyReleased() {
   if(key == 'w' || keyCode == UP)
     game.keyReleased("up");
   else if(key == 's' || keyCode == DOWN)
     game.keyReleased("down");
   else if(key == 'a' || keyCode == LEFT) 
     game.keyReleased("left");
   else if(key == 'd' || keyCode == RIGHT)
     game.keyReleased("right");
   else if(key == '1') 
     game.keyReleased("1");
   else if(key == '2')
     game.keyReleased("2");
   else if(key == '3')
     game.keyReleased("3");
   else if(key == '4')
     game.keyReleased("4");
   else if(key == '5')
     game.keyReleased("5");
   else if(key == '6')
     game.keyReleased("6");
}

// Mouse Controller
void mousePressed() {
  game.mousePressed();
}
void mouseDragged() {
  game.mouseDragged();
}
void mouseReleased() {
  game.mouseReleased();
}

class Game {
  
 private GameStateManager gsm;
  
 // Initialize instances of objects
 public Game() {
   //start the gsm and give it the state
   gsm = new GameStateManager();
   MenuState state = new MenuState(gsm);
   gsm.init(state);
 }
 
 public void update() {
   gsm.update();
 }
 
 public void render() {
   gsm.render();
 }
 
 public void keyPressed(String key) {
   gsm.keyPressed(key);
 }
 public void keyReleased(String key) {
   gsm.keyReleased(key); 
 }
 public void mousePressed() {
   gsm.mousePressed();
 }
 public void mouseDragged() {
   gsm.mouseDragged();
 }
 public void mouseReleased() {
   gsm.mouseReleased();
 }
}