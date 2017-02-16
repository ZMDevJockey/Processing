/*
Prova Comete                                                            ©ZMDevJockey
*/

ArrayList<Cometa> comete;

void setup()
{
  size(1000,600);
  frameRate(60);    // 60 è già di default, possiamo anche non scriverlo
  background(0);    // per non vedere un effetto magari indesiderato

  comete = new ArrayList<Cometa>();
}

void draw()
{
  fill(0,50);          // 50 = trasparenza per fare la scia
  noStroke();
  rect(0,0,1000,600);
  
  for(Cometa c:comete)
    c.run();
}

void keyPressed()
{
  if(key == 'n' || key == 'N') comete.add(new Cometa(0,random(50,550),random(2,10)));
}

void mousePressed()
{
  for(Cometa c:comete)
    if(c.checkMouse())  c.kill();
}
