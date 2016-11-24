/*
Classe Cometa
*/

class Cometa
{
  float posX, posY, sX, sY;
  boolean viva;
  
  Cometa(float posX, float posY, float sX)
  {
    this.posX = posX;
    this.posY = posY;
    this.sX = sX;
    sY = 0;
    
    viva = true;  
  }
  
  void display()
  {
    noStroke();
    fill(255,255,00);
    if(!viva)
     fill(128);
     
    ellipseMode(RADIUS);
    ellipse(posX, posY, 15, 15);
  }
  
  void move()
  {
    posX += sX;
    
    if(!viva) 
    {
      sY += 0.2;
      posY += sY;
  }
  
  void kill()
  {
    viva = false;
  }
  
  boolean checkMouse()
  {
    return dist(posX, posY, mouseX, mouseY) < 15;    // 15 = raggio ellisse
  }
  
  void run()
  {
    move();
    display();
  }
  
}
