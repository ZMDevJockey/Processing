/*
Classe Shuriken                                                                       ©ZMDevJockey
*/

class Shuriken
{
  float posX, posY, sX, sY;
  float R;
  boolean lanciato;
  
  Shuriken(float posX, float posY, float sX, float sY)
  {
    this.posX = posX;
    this.posY = posY;
    this.sX = sX;
    this.sY = sY;
    R = 0;
    lanciato = false;
  }
  
  void display()
  {
    noStroke();
    rectMode(CENTER);
    fill(128);
    
    pushMatrix();
    translate(posX, posY);
    rotate(radians(R));
    
    rect(0,0,30,30);
    
    pushMatrix();
    rotate(PI/4);
    rect(0,0,30,30);
    popMatrix();
    
    fill(255);
    ellipse(0,0,10,10);
    popMatrix();
  }
  
  void move()
  {
    posX += sX;
    posY += sY;
    R += 5;
  }
  
  void run()
  {
    if(lanciato) move();
    display();
  }
  
  boolean checkMouse()
  {
    return dist(posX,posY,mouseX,mouseY) < 15;
  }
  
  void lancia()
  {
    lanciato = true;     // = !lanciato se voglio fermarlo anche
  }
}
