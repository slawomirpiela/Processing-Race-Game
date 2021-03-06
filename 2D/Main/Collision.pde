boolean FindCollision(Car Player,Car Enemy)
{
    int px = Player.getX();
    int py = Player.getY();
    float pt = Player.getT()+0.14;
    
    int npx = Enemy.getX();
    int npy = Enemy.getY();
    float npt = Enemy.getT()+0.14;
  
    //Dimensions of Car
    Point Q1 = new Point(0,0);
    Point Q2 = new Point(20,0); // car Height
    Point Q3 = new Point(20,40);
    Point Q4 = new Point(0,40); // car Length
    
    //Points on Player Car
    Point P1 = new Point(Q1.x+px,Q1.y+py);
    Point P2 = new Point(Q2.x*cos(pt)+px,Q2.x*sin(pt)+py);
    Point P3 = new Point(Q3.x*cos(pt)+Q3.y*sin(-pt)+px,Q3.x*sin(pt)+Q3.y*cos(pt)+py);
    Point P4 = new Point(Q4.y*sin(-pt)+px,Q4.y*cos(pt)+py);
    
    // Points on NP Car
    Point NP1 = new Point(0+npx,0+npy);
    Point NP2 = new Point(Q2.x*cos(npt)+npx,Q2.x*sin(npt)+npy);
    Point NP3 = new Point(Q3.x*cos(npt)+Q3.y*sin(-npt)+npx,Q3.x*sin(npt)+Q3.y*cos(npt)+npy);
    Point NP4 = new Point(Q4.y*sin(-npt)+npx,Q4.y*cos(npt)+npy);
    
    //Just To See Points
    if (DebugMode == true)
    {
      text("P1",P1.x,P1.y);
      text("P2",P2.x,P2.y);
      text("P3",P3.x,P3.y);
      text("P4",P4.x,P4.y);   
      text("NP1",NP1.x,NP1.y);
      text("NP2",NP2.x,NP2.y);
      text("NP3",NP3.x,NP3.y);
      text("NP4",NP4.x,NP4.y);
    }
    
    Point [] PlayerPoints = {P1,P2,P3,P4}; // Array of Player points
    Point [] EnemyPoints = {NP1,NP2,NP3,NP4}; // Array of Enemy Points
    for (int i = 0; i<4; i++)
    {
      int Nexti = i+1; // next integer from i. e.g if i = 1, Nexti = 2
      if (Nexti == 4) // To prevent going out of bounds
      {
        Nexti = 1;
      }
      for (int j = 0; j<4; j++)
      { 
        int Nextj = j+1; // Same as above
        if (Nextj == 4) // same as above
        {
          Nextj = 1;
        }
        // Compare all lines of Car 1 with all lines of Car 2
        if(LinesIntersect(PlayerPoints[j],PlayerPoints[Nextj],EnemyPoints[i],EnemyPoints[Nexti]) == true)
        {
          return true;
        }
      }
    }
    return false;
}

boolean LinesIntersect(Point A, Point B, Point C,Point D)
{
  Point CmP = new Point(C.x - A.x, C.y - A.y); // vector from A->C (Between Lines)
  Point r = new Point(B.x - A.x, B.y - A.y); // vector from A->B (Direction Vector of Line 1)
  Point s = new Point(D.x - C.x, D.y - C.y); // vector from C->D (Direction Vector of Line 2)
  
  // Vector Cross product, each Vector against each Vector
  float CmPxr = CmP.x * r.y - CmP.y * r.x; 
  float CmPxs = CmP.x * s.y - CmP.y * s.x;
  float rxs = r.x * s.y - r.y * s.x;

  float t = CmPxs / rxs;
  float u = CmPxr / rxs;

  return (t >= 0) && (t <= 1) && (u >= 0) && (u <= 1); // if true lines have intersected
}

boolean FindScore(Car Player)
{
  int px = Player.getX();
  int py = Player.getY();
  float pt = Player.getT()+0.14; // 0.14 is a correction value
  
  //Side Of Car to make sure we collide
  Point Q3 = new Point(0,0); // car width + car length
  Point Q4 = new Point(0,40); // car length
  // Points of Car
  Point P3 = new Point(Q3.x*cos(pt)+Q3.y*sin(-pt)+px,Q3.x*sin(pt)+Q3.y*cos(pt)+py);
  Point P4 = new Point(Q4.y*sin(-pt)+px,Q4.y*cos(pt)+py);
  // Points of Start Line
  Point S1 = new Point(3*width/9,height/3-3*width/16-((height+width)/40)); // finishline start
  Point S2 = new Point(3*width/8,height/3-3*width/16+(height+width)/40); // finishline end
  
  if (DebugMode == true)
  {
    text("S1",S1.x,S1.y);
    text("S2",S2.x,S2.y);
    text("C1",P3.x,P3.y);
    text("C2",P4.x,P4.y); 
  }
  
  return LinesIntersect(P3,P4,S1,S2);
}

class Point
{
  float x,y;
  Point(float ix,float iy)
  {
      x = ix;
      y = iy;
  }
}