/*
Lezione 7.1: Operatori puntuali negativo, logaritmo, gamma                    © Z Ov3rFlow
*/

PImage imOr;

void setup()
{
  size(512,512);  
  
  imOr = loadImage("lena.jpg");
  imOr.resize(imOr.width/2,imOr.height/2);
  
  image(imOr,0,0);
  image(negativo(imOr),imOr.width,0);
  image(logaritmo(imOr),0,imOr.height);
  image(gamma(imOr,2),imOr.width,imOr.height);

}

void draw()
{
  
}

PImage negativo(PImage I)
{
  PImage R = createImage(I.width,I.height,RGB);
  
  I.loadPixels();
  R.loadPixels();
  
  float cr, cg, cb;
  for(int i = 0; i < I.pixels.length; i++)
  {
    cr = red(I.pixels[i]);
    cg = green(I.pixels[i]);
    cb = blue(I.pixels[i]);
    
    R.pixels[i] = color(255-cr, 255-cg, 255-cb);
  }
  
  R.updatePixels();
  return R;
}

PImage logaritmo(PImage I)
{
  PImage R = createImage(I.width,I.height,RGB);
  
  I.loadPixels();
  R.loadPixels();
  
  float cr, cg, cb;
  //Calcolo costante
  float c = 255.0/log(255+1);   // log in base e non cambia molto dal log in base 2.. quindi lasciamo ln che è default
  
  for(int i = 0; i < I.pixels.length; i++)
  {
    cr = red(I.pixels[i]);
    cg = green(I.pixels[i]);
    cb = blue(I.pixels[i]);
    
    R.pixels[i] = color(c*log(1+cr), c*log(1+cg), c*log(1+cb));
  }
  
  R.updatePixels();
  return R;
}

PImage gamma(PImage I, float g)
{
  PImage R = createImage(I.width,I.height,RGB);
  
  I.loadPixels();
  R.loadPixels();
  
  float cr, cg, cb;
  //Calcolo costante
  float c = 255.0/pow(255,g);
  
  for(int i = 0; i < I.pixels.length; i++)
  {
    cr = red(I.pixels[i]);
    cg = green(I.pixels[i]);
    cb = blue(I.pixels[i]);
    
    R.pixels[i] = color(c*pow(cr,g), c*pow(cg,g), c*pow(cb,g));
  }
  
  R.updatePixels();
  return R;
}
