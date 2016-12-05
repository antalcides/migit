public enum Type {
  PARTICLE;
}

public class Spawner {
  
  public Spawner(Type type, float x, float y, float xSpeed, float ySpeed, RGB colour, int life, int width, int height, int amount, RenderType renderType, GameState state) {
    if(type == Type.PARTICLE) {
      for(int i = 0; i < amount; i++) {
         state.addParticle(new Particle(x, y, xSpeed, ySpeed, width, height, life, colour, renderType));
      }
    }
  }
  
}