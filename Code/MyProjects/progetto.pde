/*
Main Sketch //aggiungere vari livelli di difficolta e collisioni comete è.è
*/

float i = 1;
int time;
boolean pausa, spawna; 
ArrayList<Cometa> comete;

void setup()
{
  size(displayWidth,displayHeight);
  background(0);
  ellipseMode(RADIUS);
  smooth();
  
  pausa = true;
  spawna = false;
  comete = new ArrayList<Cometa>();
}

void draw()
{ 
  fill(0,255,0);
  strokeWeight(4);
  stroke(255,0,0);
  ellipse(displayWidth-75,displayHeight-70,50,50);

  fill(255,0,0);
  strokeWeight(4);
  stroke(0,0,255);
  ellipse(75,displayHeight-70,50,50);
  
  fill(0,50);
  noStroke();
  rect(0,0,displayWidth,displayHeight);

  for(Cometa c:comete)
    c.run();
    
  if(spawna)
    if(frameCount % 20 == 0)
      comete.add(new Cometa(0,random(25,980),random(4,10)));
  
  //aggiustare al centro
  fill(0,255,0);
  textAlign(CENTER);  
  textSize(85);
  text("Score: " + i,displayWidth/2,displayHeight-20);

}

void mousePressed()
{
  if((dist(displayWidth-50,displayHeight-50,mouseX,mouseY) < 50))
    spawna = true;
  else 
     if((dist(50,displayHeight-50,mouseX,mouseY) < 50))
       spawna = false;
     else
       i -= 0.25;
    
  for(Cometa c:comete)
  {
    if(c.checkMouse())
    {
     c.kill();
     i += 1.25;
    }
   } 
   
   if(i <= 0)
   {
    if(pausa)
    {
     background(255,0,0);
     textSize(110);
     text("SEI CREPATO!",displayWidth/2+6,displayHeight/2-30); 
     fill(255);
     textSize(60);
     text("Tocca per ricominciare..",displayWidth/2+4,displayHeight/2+70);
     noLoop();
     spawna = false;
    } 
    else
    { 
     i = 1;
     for(Cometa c:comete)
       c.kill();
     loop();
    }
    pausa = !pausa;
   }
}
