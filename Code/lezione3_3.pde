/*
Lezione 3.3: Classi e oggetti                                                     ©Z Ov3rFlow
Modificatore di accesso in java quello di default è "default". (gli altri sono inutili perchè siamo comunque dentro la classe PApplet.. al max con private avrebbe senso qualcosa, ma evitiamo di usarlo xD)
*/

//Ball b;
Ball[] bs;
int k = 10;

void setup()
{
  size(500,500);
  smooth();
  
  bs = new Ball[k];
  for(int i = 0; i < k; i++)
    bs[i] = new Ball(random(50,450),random(50,450),random(1,10),random(1,10));        //random(incluso,escluso);
    
  //b = new Ball(100,100,5,2);
  //println(b.posX);
  
}

void draw()
{
  background(255);
  
  //b.run();
  for(int i = 0; i < k; i++)
    bs[i].run();
}
