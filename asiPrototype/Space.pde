class Space
{
  int[][][]           lights;
  int                 columns;
  int                 rows;
  int                 prevSecond;
  Player              player;
  InvaderManager      invaderManager;
  ArrayList<Invader>  invaders;
  int                 totalInvaders;
  
  Space ( int _columns, int _rows )
  {
    columns = _columns;
    rows    = _rows;
    lights  = new int[columns][rows][3];
    
    player = new Player();
    invaderManager = new InvaderManager( columns, rows );
    
    _initialize();
  }
  
  public void update()
  {
    Boolean step = false;
    if ( prevSecond != second() )
    {
      step = true;
      prevSecond = second();
    }
    
    if ( step && player.alive )
    {
      invaderManager.update();
      invaders = invaderManager.getInvadersArray();
      totalInvaders = invaders.size();
    }
    
    calculateCollision();
    
    _render();
  }
  
  public int[][][] lightsToRender()
  {
    return lights;
  }
  
  public void interactionReset()
  {
    _reset();
  }
  
  public void interactionLeft()
  {
    int playerX = player.getX();
    if ( playerX != 0 && player.alive )
    {
      player.movePlayer( playerX - 1 );
    }
  }
  
  public void interactionRight()
  {
    int playerX = player.getX();
    if ( playerX < columns - 1 && player.alive )
    {
      player.movePlayer( playerX + 1 );
    }
  }
  
  private void _initialize()
  {
    _resetLights();
  }
  
  private void calculateCollision()
  {
    Boolean updated = false;
    
    for ( int i = 0; i < totalInvaders; i++ )
    {
      Invader invader = invaders.get(i);
      if ( invader != null && invader.y == rows - 1)
      {
        if ( player.x == invader.x )
        {
          Collision.x = invader.x;
          Collision.y = invader.y;
          Collision.isCollision = true;
          player.alive = false;
          updated = true;
        }
      }
    }
    
    if ( !updated )
    {
      Collision.isCollision = false;
    }
  }
  
  private void _render()
  {
    _resetLights();
    
    // render player
    int playerX = player.getX();
    int[] playerC = player.getColorArray();
    lights[playerX][rows - 1][0] = playerC[0];
    lights[playerX][rows - 1][1] = playerC[1];
    lights[playerX][rows - 1][2] = playerC[2];
    
    
    // render invaders
    int[] invaderColor = invaderManager.getColorArray();
    for ( int i = 0; i < totalInvaders; i++ )
    {
      Invader invader = invaders.get(i);
      if ( invader != null )
      {
        lights[invader.x][invader.y][0] = invaderColor[0];
        lights[invader.x][invader.y][1] = invaderColor[1];
        lights[invader.x][invader.y][2] = invaderColor[2];
      }
    }
    
    
    // render collisions
    if ( Collision.isCollision )
    {
      lights[Collision.x][Collision.y][0] = Collision.r;
      lights[Collision.x][Collision.y][1] = Collision.g;
      lights[Collision.x][Collision.y][2] = Collision.b;
    }
  }
  
  private void _resetLights()
  {
    for ( int x = 0; x < columns; x++ )
    {
      for ( int y = 0; y < rows; y++ )
      {
        int r = 0;
        int g = 0;
        int b = 0;
        
        lights[x][y][0] = r;
        lights[x][y][1] = g;
        lights[x][y][2] = b;
      }
    }
  }
  
  private void _reset()
  {
    player.reset();
    Collision.reset();
    invaderManager.reset();
    invaders = invaderManager.getInvadersArray();
    totalInvaders = invaders.size();
  }
}
