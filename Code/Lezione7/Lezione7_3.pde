/*
Lezione 7.3: Webcam                                       © Z Ov3rFlow
*/

import processing.video.*;
Capture cam; //sottoclasse di PImage

void setup()
{
  background(0);
  size(640,480);
  
  String[] cameras = Capture.list();
  
  if(cameras.lenght == 0)
    exit();
  else
  {
    cam = new Capture(this, 320,240, cameras[0]);
    cam.start();
  }
}

void draw()
{
  if(cam.avaible())
    cam.read();
  
  image(cam,0,0);
}
