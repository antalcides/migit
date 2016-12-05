public class LevelOneUI {
 
  protected LevelOneState state;
  private UIButton[] buttons;
  
  public LevelOneUI(LevelOneState state) {
    this.state = state;  
    setup();
  }
  
  public void setup() {
    buttons = new UIButton[] {
      new TowerPurchaseButton(100 - 16, height - 75, new Sprite("ProjectileTowerUI.bmp").getImage(), 1, new String("Basic Tower that fires projectiles at enemies\nDamage: 5\nAttack Time: 60\nRange: 150\nCost: 100"), 128, 291),
      new TowerPurchaseButton(250 - 16, height - 75, new Sprite("SlowTowerUI.bmp").getImage(), 2, new String("Slowing Tower that slows enemy units movement\nDamage: 5\nAttack Time: 90\nRange: 125\nCost: 150"), 145, 291),
      new TowerPurchaseButton(400 - 16, height - 75, new Sprite("PoisonTowerUI.bmp").getImage(), 3, new String("Poison Tower that poisons enemy units (stackable)\nDamage: 2\nAttack Time: 30\nRange: 200\nCost: 200"), 150, 291),
      new TowerPurchaseButton(550 - 16, height - 75, new Sprite("AmpTowerUI.bmp").getImage(), 4, new String("Amplification Tower weakens the armour of the enemy\nDamage: 1\nAttack Time: 30\nRange: 50\nCost: 150"), 168, 291),
      new TowerPurchaseButton(700 - 16, height - 75, new Sprite("SnareTowerUI.bmp").getImage(), 5, new String("Snare Tower stops your enemies from moving\nDamage: 3\nAttack Time: 180\nRange: 150\nCost: 250"), 135, 291)
    };
  }
   
  
  public void render() {
      for (UIButton button: buttons) {
         button.render(); 
      }
      for (UIButton button: buttons) {
         if (button.isMouseInside()) {
           button.inside();
         }
      }
  }
  
  public void mousePressed() {
    /*for (UIButton button: buttons) {
         if (button.isMouseInside()) {
           button.click();
         }
    }*/
  }
  
}