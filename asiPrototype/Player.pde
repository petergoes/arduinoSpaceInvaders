class Player
{
  int x;
  color c;
  
  Player()
  {
    x = 0;
    c = #ffff00;
  }
  
  void movePlayer( int value )
  {
    x = value;
  }
  
  int getX()
  {
    return x;
  }
  
  color getColor()
  {
    return c;
  }
  
  int[] getColorArray()
  {
    int[] colors = new int[3];
    colors[0] = (c >> 16) & 0xFF; // Red
    colors[1] = (c >> 8)  & 0xFF; // Green
    colors[2] =  c        & 0xFF; // Blue
    
    return colors; 
  }
}
