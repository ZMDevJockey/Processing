/*
Lezione 4.1: (la classe Ball è presente nella sezione "Lezione3")
Struttura dati ArrayList e for each | ereditarietà con estensione di Ball                              © Z Ov3rFlow
*/

ArrayList<Ball> arr;


void setup()
{ 
  size(500,500);
  smooth();
  
  arr = new ArrayList<Ball>();
  
}

void draw()
{ 
  background(255);
  
  
  /*
  for(int i = 0; i < arr.size(); i++)
    arr.get(i).run();     //sarebbe in c++ arr[i]
  */
  
  //b sarebbe l'iteratore  - questo for fa esattamente ciò che fa il for sopra
  for(Ball b:arr)    // legge ogni oggetto di tipo ball nella struttura dati arr (for each)
    b.run();
}

void keyPressed()
{
  if(key == 'n' || key == 'N')
    arr.add(new Ball(random(50,450),random(50,450),random(1,10),random(1,10)));

  if(key == 'b' || key == 'B')
    arr.add(new BigBall(random(50,450),random(50,450),random(1,10),random(1,10)));
}
