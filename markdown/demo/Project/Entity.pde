public class Entity {
  
   protected float x, y;
   protected boolean shouldRemove;
   
   public Entity(float x, float y) {
     this.x = x;
     this.y = y;
   }
   
   // getters
   public float getX() {
     return x; 
   }
   public float getY() {
    return y; 
   }
   public boolean getShouldRemove() {
     return shouldRemove;  
   }
}