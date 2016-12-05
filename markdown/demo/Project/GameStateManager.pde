import java.util.Stack;

public class GameStateManager {
  
 private Stack<GameState> stack; 
  
 public GameStateManager() {
   stack = new Stack<GameState>();
 }
 
 public void init(GameState state) {
   stack.push(state);
 }
 
 public void update() {
   if(stack.size() == 0) return;
   stack.peek().update();
 }
 
 public void render() {
   if(stack.size() == 0) return;
   stack.peek().render();
 }
 
 public void keyPressed(String key) {
   if(stack.size() == 0) return;
   stack.peek().keyPressed(key); 
 }
 public void keyReleased(String key) {
   if(stack.size() == 0) return;
   stack.peek().keyReleased(key);
 }
 
 public void mousePressed() {
   if(stack.size() == 0) return;
   stack.peek().mousePressed();
 }
 public void mouseDragged() {
   if(stack.size() == 0) return;
   stack.peek().mouseDragged();
 }
 public void mouseReleased() {
   if(stack.size() == 0) return;
   stack.peek().mouseReleased();
 }
 
 // Getters
 public Stack<GameState> getStates() {
   return stack; 
 }
 
}