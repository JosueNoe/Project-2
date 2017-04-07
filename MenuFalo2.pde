//Logre que funcionara todo menos que se moviera el Falo :(
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.contacts.Contact;
import org.jbox2d.callbacks.ContactListener;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.dynamics.joints.*;

final int InicioMenu = 0;
final int Instrucciones = 1;
int inicio = InicioMenu;

PFont font;
PGraphics PollaImage;

Box2DProcessing box2d;
Windmill windmill;

int Jugador = 100;
final int Juego =2;

ArrayList<Particle> particles;
ArrayList<Boundary> boundaries;
ArrayList<ParticleSystem> systems;

void setup(){
  size(500, 900);
  font = createFont("ARCATER-78.VLW", 14);
  textFont(font);
  
  PollaImage = createGraphics(900,650);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -20);
  
  windmill = new Windmill(295,195);
  systems = new ArrayList<ParticleSystem>();
  particles = new ArrayList<Particle>();
  boundaries = new ArrayList<Boundary>();
  systems.add(new ParticleSystem(0, new PVector(35,130)));

  // Plataformas
  boundaries.add(new Boundary(width/7,height-750,width/5-10,10,3));
  boundaries.add(new Boundary(2*width/6,height-705,width/3-20,10,0));
  boundaries.add(new Boundary(3*width/5,height-605,width/3-10,10,10));
  boundaries.add(new Boundary(width/3,height-550,width/4,10,0));
  boundaries.add(new Boundary(width/6.9,height-480,width/3-10,10,15));
  boundaries.add(new Boundary(width/2,height-400,width/2.5-10,10,0));
  boundaries.add(new Boundary(width/1.2,height-350,width/3-10,10,7));
  boundaries.add(new Boundary(width/2,height-250,width/2-10,10,0));
}

void draw(){
  switch (inicio){
    case InicioMenu:
    showMenu();
    break;
    case Instrucciones:
    showInstrucciones();
    break;
    case Juego:
    iniciarJuego();
    break;
    default:
    exit();
    break;
  }
  

}

void keyPressed(){
  switch (inicio){
    case InicioMenu:
    PresionarshowMenu();
    break;
    case Instrucciones:
    PresionarshowInstrucciones();
    break;
    case Juego:
    PresionariniciarJuego();
  //  moverPGraphics();
    break;
    default:
    exit();
    break;
  }
}

void PresionarshowMenu(){
  switch(key){
    case '1':
    inicio = Instrucciones;
    break;
    case '2':
    inicio = Juego;
    break;
    case 'x':
    case 'X':
    exit();
    break;
    default:
    break;
  }
}

void PresionarshowInstrucciones(){
  switch(key){
    default:
    inicio = InicioMenu;
    break;
  }
}

void PresionariniciarJuego(){
  switch(key){
    default:
    inicio = InicioMenu;
    break;
  }
}

//void moverPGraphics(){
 // switch(keyPressed){
   // if (key == 'b' || key == 'B');
     // PollaImage = +10;
    //} 
   // else {
    //PollaImage = 0
  //}

void showMenu(){
  background(204, 204, 255);
  fill(153,random(153),255);
  textSize(60);
  text(" Happy .I. ", 90, 100, 3);
  fill(102,random(102),255);
  textSize(25);
  text("Instrucciones: Presiona 1 ", 90, 340);
  text("Iniciar Juego: Presiona 2 ", 90, 370);
  text("Salir: Presiona x ", 140, 660);
}

void  showInstrucciones() {
  background(255, 204, 229);
  fill(255,random(153),204);
  textSize(30);
  text(" Instrucciones ", 70, 100, 3);
  textSize(15);
  text(" El pequeño Dick, solo puede moverse de izquierda a derecha", 40, 200);
  text(" con las teclas N y M. ", 40, 220);
  text(" Dick no debe ser tocado por las celulas del VIH,", 40, 240);
  text(" por lo que debes ser mas rapido que ellas, para llegar", 40, 260);
  text(" a la meta.", 40, 280);
  textSize(30);
  text(" Presiona 2, para Iniciar", 70, 500);
}

void iniciarJuego() {
  background(204,229,255);
  box2d.step();
  windmill.display();
  Polla();
  
  for (ParticleSystem system: systems) {
  system.run();
    int n = (int) random(0,2);
    system.addParticles(n);
  }
  
  for (Boundary wall: boundaries) {
    wall.display();
  }

}
//agregar mas agua, para dificultar el juego
void mousePressed() {
  systems.add(new ParticleSystem(0, new PVector(mouseX,mouseY)));
}