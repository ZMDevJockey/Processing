/*
Lezione 6.2: Rotazione, Riscalaggio, Shear (Tramite forward mapping)             ©ZMDevJockey
*/

PImage imOr, imRot, imS;

void setup()
{
  size(512,512);
  
  imOr = loadImage("lena.jpg");
  imOr.resize(imOr.width/2,imOr.height/2);
  
  imRot = imRotate(imOr,45);
  imS = imScale(imOr,0.5,0.5);
  
  image(imOr,0,0);
  image(imRot,imOr.width,0);
  image(imS,0,imOr.height);
}

void draw()
{
  
}

PImage imRotate(PImage I, float angolo)    //tramite forward mapping
{
  PImage R = createImage(I.width,I.height, RGB);
  
  float x, y; //Output
  angolo = radians(angolo);
  
  for(int v = 0; v < I.width; v++)
  {
    for(int w = 0; w < I.height; w++)
    {
      v -= I.width/2;   //traslazione per ruotare rispetto al centro dell'immagine
      w -= I.height/2;
      
      //Rotazione
      x = v*cos(angolo) - w*sin(angolo);   //mettere il - nella y e il + nella x per fare in senso antiorario
      y = v*cos(angolo) + w*cos(angolo);
    
      x += I.width/2;  //traslazione inversa
      y += I.height/2;
      v += I.width/2;
      w += I.height/2;
    
      R.set(int(x), int(y), I.get(v,w));   //prendo il colore di ogni pixel
    }
  }
   
  R.updatePixels();
  return R;
}

PImage imScale(PImage I, float sX, float sY)
{
  PImage R = createImage(I.width,I.height, RGB);
  
  float x, y; //Output
  
  for(int v = 0; v < I.width; v++)
  {
    for(int w = 0; w < I.height; w++)
    {
      v -= I.width/2;   //traslazione per scalare rispetto al centro dell'immagine
      w -= I.height/2;
      
      //Scaling
      x = v*sX;
      y = w*sY;
    
      x += I.width/2;  //traslazione inversa
      y += I.height/2;
      v += I.width/2;
      w += I.height/2;
    
      R.set(int(x), int(y), I.get(v,w));
    }
  }
  
  R.updatePixels();
  return R;
}

//fare lo shear xD
