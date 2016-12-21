/*
Lezione 6.3: Quantizzazione                © Z Ov3rFlow
*/

PImage imOr, imQ;


void setup()
{
  size(512,512);
  
  imOr = loadImage("lena.jpg");
  imOr.filter(GRAY);
  
  imQ = imQuant(imOr,16);
  
  image(imQ,0,0);
}

void draw()
{
  
}

PImage imQuant(PImage I, int k)
{
  PImage R = I.copy();
  
  I.loadPixels();
  R.loadPixels();
  
  float c;
  int v;
  for(int i = 0; i < I.pixels.length; i++)
  {
    c = red(I.pixels[i]);
    
    //Quantizzazione
    v = floor(k*(c/256));
    
    //Normalizzazione solo per visualizzare
    v = int((float(v)/(k-1)) *255);
    
    R.pixels[i] = color(v);
  }
  
  return R;
}

void keyPressed()
{
  if (key=='+')
  {
    if (Q<256)
    {
      Q++;
      qim=quantizza(image,Q);
    }
  }
  
  if (key=='-')
  {
    if (Q>2)
    {
      Q--;
      qim=quantizza(image,Q);
    }
  }
  
  if (key=='o')
  { 
    Q=256;
    qim=image.copy();
  }
  
  if (key=='t')
  { 
    Q=2;
    qim=quantizza(image,Q);
  }
}
