char [] Keys = {'w','s','a','d','i','k','j','l','R','z','x'};
Boolean [] KeyPress = new Boolean[20];

void GetKeyPresses()
{
  
  if(KeyPress[0] == true) // Move Up
  
  {
    cypos -= CamMoveSpeed;
  }
  
  if(KeyPress[1] == true) // Move down
  {
    cypos += CamMoveSpeed;
  }
  
  if(KeyPress[2] == true) // Move Left
  {
    cxpos -= CamMoveSpeed;
  }
  
  if(KeyPress[3] == true) // Move Right
  {
    cxpos += CamMoveSpeed;
  }
  
  if(KeyPress[4] == true) // Orbit Up
  {
    UDrotation++;
  }
  if(KeyPress[5] == true) // Orbit down
  {
    UDrotation--;
  }
  if (KeyPress[6] == true)// Orbit Left
  {
    LRrotation++;
  }
  if (KeyPress[7] == true)// Orbit Right
  {
    LRrotation--;
  }
  if (KeyPress[8] == true)// Reset
  {
    LRrotation = 0;
    UDrotation = 0;
    Izpos = 0;
    Ixpos = 0;
    cxpos = 0;
    cypos = 0;
  }
  if (KeyPress[9] == true)// Zoom In
  {
    orbitRadius -= 5;
  }
  if (KeyPress[10] == true)// Zoom Out
  {
    orbitRadius += 5;
  }
  
}

//--------------------------------------------------
// Don't Need To Touch
//--------------------------------------------------
void keyPressed() // define what happens when specific keys are pressed
{
  if(key == 'g' && !FPMtoggle)
  {
    isFPM =! isFPM;
    FPMtoggle = true;
  }
  
  for (int i = 0; i< Keys.length; i++)
  {
    if(key == Keys[i])
      KeyPress[i] = true;
  }
  if(key== CarArray[0].getControl())
    CarArray[0].KeyPressed = true;
  if(key==CarArray[1].getControl())
    CarArray[1].KeyPressed=true;
}
  
void keyReleased() // needed for multi touch controls
{
   if(key == 'g')
  {
    FPMtoggle=false;
  }
  
  for (int i = 0; i< Keys.length; i++)
  {
    if(key == Keys[i])
      KeyPress[i] = false;
  }
  if(key==CarArray[0].getControl())
    CarArray[0].KeyPressed=false;
  if(key==CarArray[1].getControl())
    CarArray[1].KeyPressed=false;
}