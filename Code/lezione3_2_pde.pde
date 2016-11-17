/*
Lezione 3: Far ruotare, traslare, scalare e shear oggetti su se stessi xD
*/


float r;
float posX, posY;
float speedX, speedY;
float shx, shy;
float sc;          //fattore di scala

void setup()
{
  size(500,500);
  rectMode(CENTER);
  smooth();
  
  r = 0;
  posX = posY = 0;
  speedX = 2;
  speedY = 1;
  shx = radians(1);          //90 gradi degenera in un segmento xD E' l'angolo che vi è fra due lati che prima della trasformazione erano perpendicolari
  sc = 1;
}

void draw()
{
 background(255);
 
 //Rotate
 fill(255,0,0);
 pushMatrix();
 translate(mouseX,mouseY);
 rotate(radians(r));                             //= applyMatrix(cos(r), -sin(r), 0                con la matrice di rotazione  (stessa cosa con matrici delle altre trasformazioni
 rect(0,0,100,100);                              //              sin(r), cos(r), 0);
 popMatrix();
 
 //Translate
 fill(0,255,0);
 pushMatrix();
 translate(posX,posY);
 rect(0,0,100,100);
 popMatrix();
 
 //Shear
 fill(0,0,255);
 pushMatrix();
 translate(100,100);
 shearX(shx);            //Per farlo sulle y usare shearY(shy);
 rect(0,0,100,100);
 popMatrix();
 
 //Scale
 fill(255,255,0);
 pushMatrix();
 translate(300,300);
 scale(sc);            //Per farlo sulle y usare shearY(shy);
 rect(0,0,100,100);
 popMatrix();
 
 r += 5;          //70 se vogliamo l'alias della ruota che gira xD
 
 posX += speedX;
 posY += speedY;
 
 shx += radians(2);
 
 sc += 0.01;
}