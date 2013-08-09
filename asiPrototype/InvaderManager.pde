class InvaderManager
{
  color invaderColor;
  ArrayList<Invader> invaders;
  
  InvaderManager( int columns, int rows )
  {
    invaderColor = #ff00ff;
    invaders = new ArrayList<Invader>();
    invaders.add( new Invader(0, 0) );
  }
  
  public void update()
  {
    int totalInvaders = invaders.size();
    for ( int i = totalInvaders; i > 0; i-- )
    {
      Invader invader = invaders.get(i - 1);
      if ( invader != null )
      {
        if ( invader.y == rows - 1 )
        {
          invader = null;
          invaders.remove(i - 1);
        }
        else
        {
          invader.y++;
        }
      }
    }
    
    float r = random(1);
    if ( r > 0.5 )
    {
      invaders.add( new Invader( int(random(4)), 0 ) );
    }
  }
  
  public ArrayList<Invader> getInvadersArray()
  {
    return invaders;
  }
  
  public int[] getColorArray()
  {
    int[] colors = new int[3];
    colors[0] = (invaderColor >> 16) & 0xFF; // Red
    colors[1] = (invaderColor >> 8)  & 0xFF; // Green
    colors[2] =  invaderColor        & 0xFF; // Blue
    
    return colors; 
  }
}
