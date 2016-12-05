public class Node implements Comparable<Node> {
  public int x, y;
  public Node parent;
  public double fCost, gCost, hCost;
  
  public Node(int x, int y, Node parent, double gCost, double hCost) {
    this.x = x;
    this.y = y;
    this.parent = parent;
    this.gCost = gCost;
    this.hCost = gCost;
    this.fCost = this.gCost + this.hCost;
  }
  
  public int compareTo(Node other) {
    if(other.fCost < this.fCost)
      return 1;
    else if(other.fCost > this.fCost)
      return -1;
    else
      return 0;
  }
}