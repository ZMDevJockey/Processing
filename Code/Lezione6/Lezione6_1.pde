/*
Lezione 6.1: PSNR (non completo in quanto vi è un errore da correggere ancora)        © Z Ov3rFlow
*/

PImage imOr, imRes, imPro, imRep;
float psnrOrPro, psnrOrRep, psnrOrOr;

void setup()
{ 
  size(512,512);
  
  imOr = loadImage("lena.jpg");
  imRes = imOr.copy();
  
  imRes.resize(imOr.width/2,imOr.height/2);
  
  imPro = imRes.copy();
  imPro.resize(imRes.width*2,imRes.height*2);
  
  imRep = intRep(imRes);
  
  psnrOrPro = PSNR(imOr, imPro);
  psnrOrRep = PSNR(imOr, imRep);
  psnrOrOr = PSNR(imOr, imOr);   // darà più infinito
  
  println("PSNR tra originale e algoritmo di processing:" + psnrOrPro);
  println("PSNR tra originale e replication");
  println("PSNR tra originale e originale" + psnrOrOr);
  
  image(imOr,0,0);
  
}

void draw()
{ 
  
}

void keyPressed()
{
  switch(key)
  {
    case '1':     //se non funziona mettere su una riga o mettere le parentesi graffe
     image(imOr,0,0); 
     break;
    case '2':
     image(imPro,0,0);
     break;
    case '3':
     image(imRep,0,0);
  }
}

PImage intRep(PImage I)
{
  PImage R = createImage(I.width*2,I.height*2,RGB);
  
  I.loadPixels();
  R.loadPixels();
  
  int w = I.width;
  
  for(int i = 0; i < I.width; i++)
  {
    for(int j = 0; j < I.height; j++)
    {
      R.pixels[getPos(i*2,j*2,w*2)] = I.pixels[getPos(i,j,w)];
      R.pixels[getPos(i*2+1,j*2,w*2)] = I.pixels[getPos(i,j,w)];
      R.pixels[getPos(i*2,j*2+1,w*2)] = I.pixels[getPos(i,j,w)];
      R.pixels[getPos(i*2+1,j*2+1,w*2)] = I.pixels[getPos(i,j,w)];
    }
  }
  
  R.updatePixels();
  return R;
}

int getPos(int i, int j, int w)   //ritorna la posizione
{
  return i*w+j;
}

float PSNR(PImage I1, PImage I2)
{
  PImage I1G, I2G;
  float psnr;
  
  I1G = I1.copy();
  I2G = I2.copy();
  
  I1G.filter(GRAY);
  I2G.filter(GRAY);
  
  I1G.loadPixels();
  I2G.loadPixels();
  
  float MSE = 0;
  float c1, c2;
  
  for(int i = 0; i < I1G.pixels.length; i++)
  {
    c1 = red(I1G.pixels[i]);   // red = green = blue in scala di grigi sono uguali quindi uso uno qualunque
    c2 = blue(I2G.pixels[i]);
    
    MSE += (c1-c2)*(c1-c2);
  }
  
  MSE /= I1G.pixels.length;
  
  psnr = 20*log(255.0/sqrt(MSE))/log(10);   //cambio di base per farlo in base 10
  
  return psnr;
}                                                                   
                                                                                    © Z Ov3rFlow
