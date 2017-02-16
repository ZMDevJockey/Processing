/*
Lezione7.2: Stretching e equalizzazione                    ©ZMDevJockey
*/

PImage imOr;

void setup()
{
  size(768,256);
  
  imOr = loadImage("lena.jpg");
  imOr.filter(GRAY);
  imOr.resize(imOr.width/2,imOr.height/2);
  
  image(imOr,0,0);
  image(stretch(imOr),imOr.width,0);
  image(equalizza(imOr),imOr.width*2,0);
}

void draw()
{
  
}

PImage stretch(PImage I)
{
  PImage R = createImage(I.width,I.height,RGB);
  
  I.loadPixels();
  R.loadPixels();
  
  float max = red(I.pixels[0]), min = red(I.pixels[0]);  //Supponiamo cje sia a scala di grigi
  float val;
  for(int i = 0; i < I.pixels.length; i++)
  {
    val = red(I.pixels[i]);
    
    if(val > max) max = val;  //da ottimizzare lol
    if(val < min) min = val;
  }
  
  for(int i = 0; i < I.pixels.length; i++)
  {
    val = red(I.pixels[i]);
    
    R.pixels[i] = color(255 * (val-min)/(max-min));
  }
  
  R.updatePixels();
  return R;
}

float[] calcoloIstogramma(PImage I)
{
  float[] H = new float[256];
  
  I.loadPixels();
  
  //Calcolo
  for(int i = 0; i < I.pixels.length; i++)
    H[int(green(I.pixels[i]))]++;
  
  // lo posso evitare incrementando di 1/mn nel for precedente
  //Normalizzazione
  for(int i = 0; i < 256; i++)
    H[i] = H[i]/I.pixels.length;
    
  return H;
}

PImage equalizza(PImage I)
{
  PImage R = createImage(I.width,I.height,RGB);
  
  I.loadPixels();
  R.loadPixels();
  
  float[] Pr = calcoloIstogramma(I);
  //Istogramma cumulativo
  float[] Hc = new float[256];
  
  Hc[0] = Pr[0];
  for(int i = 1; i < 256; i++)
    Hc[i] = Hc[i-1] + Pr[i];
  
  for(int i = 0; i < I.pixels.length; i++)
    R.pixels[i] = color(round(255 * Hc[int(red(I.pixels[i]))]));  //round per arrotondare
  
  R.updatePixels();
  return R;
}
