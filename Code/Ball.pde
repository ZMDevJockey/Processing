/*
Class Ball
*/

class Ball
{
  float posX, posY, sX, sY;
  
  //Costruttore                    (Distruttore non esiste in java è.è)
  Ball(float posX, float posY, float sX, float sY)
  {
   this.posX = posX;
   this.posY = posY;
   this.sX = sX;
   this.sY = sY;
  }
  
  Ball(float posX, float posY)
  {
   this(posX,posY,1,1);                        //Chiama il costruttore precedente nell'ordine in cui abbiamo scritto
  }                                            //super(...) per le sottoclassi
  
  //Metodo che visualizza (nome qualunque)
  void display()
  {
    fill(0,255,0);                  //Dal momento in cui viene chiamato in poi viene ricordato così come le altre primitive.. => se non c'è un altro fill anche le altre figure saranno così nel "main"
    noStroke();
    ellipse(posX,posY,50,50);
  }
  
  //Metodo che fa muovere l'oggetto
  void move()
  {
    posX += sX;
    posY += sY;
  }
  
  //Metodo che fa rimbalzare
  void bounce()
  {
    if((posX <= 0+25) || (posX >=width-25))        //25 = raggio/2
      sX = -sX;
    
    if((posY <= 0+25) || (posY >=height-25))
    {
      sY = -sY;
      if(posY >= height-25)
        posY = height-25;       //Per evitare bug che mi era capitato a pong ahah xD
    }
  }
  
  void gravity()            //Per rallentare devo sottrarre poichè le y vanno verso il basso
  {
    sY += 0.3;
  }
  
  void run()
  {
    gravity();
    move();
    bounce();
    display();
  }
  
}