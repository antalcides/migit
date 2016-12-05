public abstract class UIElement {
      
     protected float x;
     protected float y;
    

     // When and if we have sprites
     public UIElement(float x, float y) {
         this.x = x;
         this.y = y;
     }
     
     public abstract void render();
}

/* --------------Buttons----------------- */
public abstract class UIButton extends UIElement {
  
   protected float radius = 35.0f;
   protected PImage image;
   protected int[] rgb;
   protected int hotkey; // Used as a shortcut instead of clicking the tower (ie. hitting '3' instead of clicking the button)
    
  
   // When and if we have sprites
   public UIButton(float x, float y, PImage image, int hotkey) {
       super(x, y);
       this.image = image;
       this.hotkey = hotkey;
   }
   
   public UIButton(float x, float y, int[] rgb, int hotkey) {
       super(x, y);
       this.rgb = rgb;
       this.hotkey = hotkey;
   }
   
   public boolean isMouseInside() {
      if (x < mouseX && mouseX < x + radius && y < mouseY && mouseY < y + radius) {
         return true; 
      }
      return false;
   }
   
   public abstract void inside();
  
   public abstract void click();
   
   // Setters
   public void setHotkey(int num) {
     hotkey = num;
   }
   
   // Getters
   public int getHotkey() {
     return hotkey;  
   }
}

public class TowerPurchaseButton extends UIButton {
    //UI
    public Sprite towerDescriptionUI = new Sprite("towerInfoUI.png");
    
    // Hotkey display font
    PFont font = createFont("Gothic.ttf", 24, true);  
    private String info;
    private float infoUIX, infoUIY;
  
    public TowerPurchaseButton(float x, float y, int[] rgb, int hotkey, String info, float infoUIX, float infoUIY) {
        super(x, y, rgb, hotkey);
        this.info = info;
        this.infoUIX = infoUIX;
        this.infoUIY = infoUIY;
    }
    public TowerPurchaseButton(float x, float y, PImage image, int hotkey, String info, float infoUIX, float infoUIY) {
      super(x, y, image, hotkey);  
      this.info = info;
      this.infoUIX = infoUIX;
      this.infoUIY = infoUIY;
    }
    
    public void render() {
      if(image == null) {
        fill(rgb[0], rgb[1], rgb[2]);  
        ellipse(x, y, radius, radius);
      }
      else {
        image(image, x, y);    
        fill(255, 0, 0);
        textFont(font);
        fill(0, 0, 0);
        text(hotkey, x + radius / 2 - 7, y + 56);
      }
    }
    
    public void inside() {
      fill(125, 2, 88);
      image(towerDescriptionUI.getImage(), infoUIX, infoUIY);
      text(info, 185, y - 200);
    }
    
    public void click() {
      
    }
}
/* --------------End Buttons----------------- */