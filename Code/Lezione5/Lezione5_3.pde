/*
lezione 5.3: I 3 canali                                                     ©ZMDevJockey
*/

PImage Im, R, G, B, ImG;

void setup()
{
  size(700,700);
  
  Im = loadImage("lena.jpg");
  
  Im.resize(Im.width/2,Im.height/2);
  
  ImG = Im.copy();   //così modifico solo la copia perchè poi mi serve l'originale per estrarre i canali
  ImG.filter(GRAY);
  
  image(Im,0,0);
  
  R = createImage(Im.width,Im.height,RGB);
  G = createImage(Im.width,Im.height,RGB);
  B = createImage(Im.width,Im.height,RGB);
  
  Im.loadPixels();
  R.loadPixels();
  G.loadPixels();
  B.loadPixels();
  
  float cr, cg, cb;
  
  for(int i = 0; i < Im.pixels.length; i++)
  {
    cr = red(Im.pixels[i]);   //numero che rappresenta l'intensità del rosso
    cg = green(Im.pixels[i]);
    cb = blue(Im.pixels[i]);
 
    R.pixels[i] = color(cr);
    G.pixels[i] = color(cg);
    B.pixels[i] = color(cb);
  }
  
  R.updatePixels();
  G.updatePixels();
  B.updatePixels();
  
  image(R,Im.width,0);
  image(G,0,Im.height);
  image(B,Im.width,Im.height);
}

void draw()
{
  imageMode(CORNER);
  
  image(Im,0,0);
  image(R,Im.width,0);
  image(G,0,Im.height);
  image(B,Im.width,Im.height);
  
  if(mousePressed)
  {
    if(mouseX < Im.width*2 && mouseY < Im.height*2)
    {
      imageMode(CENTER);
      image(ImG,256,256);
    }
  }
}
