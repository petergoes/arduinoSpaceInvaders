class Space
{
  int[][][] lights;
  int columns;
  int rows;
  
  
  Space ( int _columns, int _rows )
  {
    columns = _columns;
    rows    = _rows;
    lights  = new int[columns][rows][3];
    
    initialize();
  }
  
  void initialize()
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
  
  int[][][] lightsToRender()
  {
    return lights;
  }
}
