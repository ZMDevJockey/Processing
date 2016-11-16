/*
[EN] Bezier simple example with a triangle.
[IT] Semplice esempio su Bezier con un tringolo.                       ©Z Ov3rFlow
*/


float x1,y1,x2,y2,x3,y3; //per bezier basta fare un altro punto

void setup()
{
  size(720,1280);
  smooth();
  
  x1 = 200;
  y1 = 260;
  
  x2 = 230;
  y2 = 350;
  
  x3 = 400;
  y3 = 400;
}

void draw()
{                                              // <= 5 su pc
  if(mousePressed && (dist(x1,y1,pmouseX,pmouseY) <= 20)) //pmouseX pmouseY posizione del mouse al frame precedente perché se mi muovo troppo veloce non funziona
  {
    x1 = mouseX;               
    y1 = mouseY;
  }
  // basta fare la priorità con un array o un else if.. perché cosi si sovrappongono
  if(mousePressed && (dist(x2,y2,pmouseX,pmouseY) <= 20)) //pmouseX pmouseY posizione del mouse al frame precedente perché se mi muovo troppo veloce non funziona
  {
    x2 = mouseX;               
    y2 = mouseY;
  }
  
  if(mousePressed && (dist(x3,y3,pmouseX,pmouseY) <= 20)) //pmouseX pmouseY posizione del mouse al frame precedente perché se mi muovo troppo veloce non funziona
  {
    x3 = mouseX;               
    y3 = mouseY;
  }
  
  background(255);
  
  fill(0);
  triangle(x1,y1,x2,y2,x3,y3);
  
  noStroke();
  fill(255,0,0);
  ellipse(x1,y1,40,40);
  fill(0,255,0);
  ellipse(x2,y2,40,40);
  fill(0,0,255);
  ellipse(x3,y3,40,40);
  
}
