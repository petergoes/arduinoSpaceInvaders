class Player
{
  int x;
  color c;
  Boolean alive;
  
  Player()
  {
    c = #ffff00;
    reset();
  }
  
  public void movePlayer( int value )
  {
    x = value;
  }
  
  public int getX()
  {
    return x;
  }
  
  public color getColor()
  {
    return c;
  }
  
  public int[] getColorArray()
  {
    int[] colors = new int[3];
    colors[0] = (c >> 16) & 0xFF; // Red
    colors[1] = (c >> 8)  & 0xFF; // Green
    colors[2] =  c        & 0xFF; // Blue
    
    return colors; 
  }
  
  public void reset()
  {
    x = 0;
    alive = true;
  }
}
