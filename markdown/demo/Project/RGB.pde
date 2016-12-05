public class RGB {
  
  public int red, green, blue;
  
  public RGB(int red, int green, int blue) {
    if(red >= 0 && red <= 255 && green >= 0 && green <= 255 && blue >= 0 && blue <= 255) {
      this.red = red;
      this.green = green;
      this.blue = blue;
    }
    else {
      System.out.println("ERROR OCCURRED IN RGB CONSTRUCTOR");
      System.exit(1);
    }
  }
  
}