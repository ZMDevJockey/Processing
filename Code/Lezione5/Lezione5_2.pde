/*
Lezione 5.2: Sfumatura                                            ©ZMDevJockey
*/


PImage nIm;

void setup()
{
  size(512,512);
  
  nIm = createImage(200,200,RGB);   //o HSV scritto come HSB (brightness) ; e l'immagine di default è nera

  background(255);
  image(nIm,0,0);

  nIm.loadPixels();   //pixels contiene tutti i pixel in un array uno dopo l'altro
  //nIm.pixels[0];      accedo al pixel in alto a sinistra

  for(int i = 0; i < nIm.pixels.length; i++)
  {
    //nIm.pixels[i] = color(i,0,0);   //* vedi sotto che ho sbagliato riga
    //nIm.pixels[i] = color(255 * float(i)/(nIm.pixels.length-1),0,0);   //normalizzato xD
    //oppure:    o anche "map" da cercare
    nIm.pixels[i] = color(lerp(0,255,float(i)/(nIm.pixels.length-1)),0,0);   //normalizzato xD linear interpolation ; lerp(a,b,c); con 0<c<1
  
    //nIm.pixels[i] = c;
    
  }

  nIm.updatePixels();     //farlo sempre dopo la modifica

  image(nIm,50,50);    // *no perchè sfora dopo i 255 e li riporta a 255
                                                                                          
  //PImage nn = nIm.copy();   // copia l'immagine ; oppure posso copiare un pezzo di immagine:
  PImage nn = createImage(500,500,RGB);
  nn.copy(nIm,0,0,100,100,0,0,100,100);  //copy(sorgente, pixel in alto a sinistra, lunghezza, altezza, pixel alto a sinistra destinazione, lunghezza destinazione, altezza destinazione); se i valori lun e alt sono diversi fará un'interpolation

  image(nn,400,400);
  
  //oppure
  PImage nn2 = nIm.get(0,0,100,100);
  image(nn2,400,200);
}

void draw()
{
  
}
