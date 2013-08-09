// prototype variables
int screenWidth  = 480;
int screenHeight = 800;
int lightMargin  = 20;
int r            = 0;
int g            = 1;
int b            = 2;
int cellWidth;
int cellHeight;
int lightWidth;
int lightHeight;

// asi variables
int columns      = 4;
int rows         = 6;
Space space;

void setup()
{
  size(screenWidth, screenHeight);
  
  cellWidth   = screenWidth / columns;
  cellHeight  = cellWidth;
  
  lightWidth  = cellWidth - lightMargin;
  lightHeight = cellHeight - lightMargin;
  
  space = new Space( columns, rows );
}

void draw()
{
  clear();
  background(20);
  
  space.update();
  
  render( space.lightsToRender() );
}

void render( int[][][] lights )
{
  // Draw lights
  for ( int x = 0; x < columns; x++ )
  {
    for ( int y = 0; y < rows; y++ )
    {
      pushMatrix();
      
      translate(cellWidth * x, cellHeight * y);
      
      fill( 
        color(
          lights[x][y][r], 
          lights[x][y][g], 
          lights[x][y][b]
        ) 
      );
       
      rect( (lightMargin * .5), (lightMargin * .5), lightWidth, lightHeight);
      
      popMatrix();
    }
  }
}

void keyReleased()
{
  if ( key==CODED )
  {
    if ( keyCode == RIGHT )
    {
      space.interactionRight();
    }
    if ( keyCode == LEFT )
    {
      space.interactionLeft();
    }
  }
  
  if ( key == 'r' || key == 'R')
  {
    space.interactionReset();
  }
}
