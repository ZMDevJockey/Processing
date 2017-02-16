/*1
Lezione 3.1: Operazioni affini - translate, shear, rotate (come punto di riferimento si considera l'origine degli assi)
                                VANNO MESSE PRIMA DEI DISEGNI, ciò che sta prima non le subisce                   ©ZMDevJockey
*/

//Come se fosse uno stack, le operazioni affini vengono eseguite in ordine inverso rispetto alla posizione in cui le posizioniamo nel codice
//pushMatrix e popMatrix salvano il piano di disegno (push), così posso disegnare e trasformare oggetti e dopodichè (pop) ho effettuato le modifiche solo su oggetti che volevo.

void setup()
{
  size(500,500);
  rectMode(CENTER);
  //translate(250,250);         //sposta l'origine nel punto x,y
  
  
  strokeWeight(5);
  noFill();
  rect(0,0,500,500);          //per rappresentare l'origine e vedere come viene modificata
  
  pushMatrix();               //salva ciò che vi era prima
  translate(50,50);
  rotate(radians(45));        //di default in radianti (PI = pi greco, HALF_PI = PI/2) es rotate(PI/8); rotate(radians(x)); dove x è espresso in gradi
  //rect(50,50,100,100);     
  rect(0,0,100,100);          //per rototraslazione: prima ruotiamo l'oggetto disegnato all'origine, e dopo trasliamo su dove volevamo fosse la posizione
  ellipse(25,25,50,50);
  popMatrix();                //aggiungi ciò che vi era prima
  
  //translate(250,250);      non ha effetto sugli oggetti sopra
}
