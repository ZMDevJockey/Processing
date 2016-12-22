/*
Lezione 7.3: Webcam                                       © Z Ov3rFlow
P.S. E' necessario installare la libreria processing.video andando su: File -> Examples -> Add Examples -> Library -> Cerca "processing.video"
*/

import processing.video.*;
Capture cam; //sottoclasse di PImage

void setup()
{
  background(0);
  size(640,480);
  
  //Contiene le cam disponibili
  String[] cameras = Capture.list();
  
  //Controllo se non vi sono cam disponibili
  if(cameras.length == 0)
    exit();
  else
  {
    cam = new Capture(this, 320,240, cameras[0]);
    cam.start();
  }
}

void draw()
{
  if(cam.available())
    cam.read();
  
  image(cam,0,0);
}
