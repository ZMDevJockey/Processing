/*
Lezione 4.2:  Shuriken                                                      © Z Ov3rFlow
*/

Shuriken s1;

void setup()
{
  size(500,500);
  s1 = new Shuriken(50,50,1,1);
}

void draw()
{
  background(255);
  s1.run();
}

void mousePressed()
{
  if(s1.checkMouse())  s1.lancia();
}
