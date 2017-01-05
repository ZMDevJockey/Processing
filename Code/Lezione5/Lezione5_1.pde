/*
Lezione 5: "Contagocce"                                                     © Z Ov3rFlow
*/

PImage im;
//String url = "indirizzoImmagine";
color c;

void setup()
{
  size(512,512);
  background(0);
  
  im = loadImage("lena.jpg");    //messa nella cartella data dentro la cartella dello sketch o in quest'ultima direttament
  //im = loadImage(url);

  im.resize(im.width/2,im.height/2);    //ridimensionare l'immagine (stiamo dimezzando)
 
  image(im,0,0);    // coordinate punto in alto a sinistra
  image(im,0,0,200,200);    //visualizza con le ultime due dimensioni ma ciò non modifica l'immagine

  println(im,width);    //su console dimensioni immagine
  println(im,height);

  
 
}

void draw()
{
  image(im,0,0);
}

void mousePressed()
{
  //fare controllo se clicclo fuori dall'immagine non deve succedere nulla, altrimenti ritorna non il colore di sfondo ma un errore oppure 0
  c = im.get(mouseX,mouseY);
  
  im.set(mouseX,mouseY,color(0));   //tanti punti neri lol cambia il colore in quella posizione
  
  println(red(c) + " " + green(c) + " " + blue(c));    //restituisce in complemento a due => usare Red Green Blue
  fill(c);
  noStroke();   
  rect(400,400,50,50);       //tipo contagocce xD se usiamo invece la variabile mousePressed nel draw possiamo vedere ogni volta che passiamo sopra, non che clicchiamo
}

void keyPressed()
{
  //se da problemi mettere uno slash prima oppure fare (modo elegante) : im.save(savePath("lena.png"));
  im.save("lena2.png");   //oppure im.save("lena2",PNG);)   viene salvata non in data ma nella cartella dello sketch
}
