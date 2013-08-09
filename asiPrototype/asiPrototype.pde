/**
 * This is the prototype of the Arduino project arduinoSpaceInvaders
 * In this prototype I tried came up with the game logic that is going to be ported to the Arduino.
 * The class you have in front of you, is the renderer to let Processing render the tiles virtually which represents physical tiles in the final product,
 * and the interface for the user. In this case, it pushes keyboadr input to the Space class.
 */


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

// acts as an update method
void draw()
{
  clear();
  background(20);
  
  space.update();
  
  render( space.lightsToRender() );
}

// The render method. In the Arduino project, this is the place to power the LED's and give them their color 
void render( int[][][] lights )
{
  // Draw cells
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

// In the Arduino project, this will be the reading of buttons or sensors, and push those values to the Space object.
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
