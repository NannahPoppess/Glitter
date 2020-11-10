import controlP5.*; //<>// //<>// //<>// //<>//
import geomerative.*;


ControlP5 cp5;


RShape obj;
boolean ignoringStyles = false;

float density =0.12; //gestosc brokatu

String SVGnum = "10.svg";
float objScaleX =.10;
float objScaleY =.10;
int objTranslateX=20;
int objTranslateY=20;

float theta;   
color c1;
color c2;

PImage img;
ArrayList<GlitterShape> glitterShapes;

int imageResX = 1500;
int imageResY = 1500;
UI ui;

void setup() {
  frameRate(60);
  colorMode(HSB);
  //rectMode(CENTER);
  //imageMode(CENTER);
  size(1600, 1600);
  cp5 = new ControlP5( this );
  ui = new UI( "test" );

  // VERY IMPORTANT: Allways initialize the library before using it
  RG.init(this);
  RG.ignoreStyles(ignoringStyles);

  smooth(8);
 //  noCursor();

  filter(DILATE);
  RG.ignoreStyles(true);


  glitterShapes = new ArrayList();

  img = loadImage("photo.png"); 
  img.resize(imageResX, imageResY);
}

void draw() {
  ui.drawUIBackground();
  stroke(255);  
    strokeWeight(2);
  noFill();
  pushMatrix();
  obj = RG.loadShape(SVGnum);
  //obj.translate(objTranslateX, objTranslateY);
  obj.centerIn(g, 1, 1, 1);
  obj.scale(objScaleX, objScaleY);
  obj.translate(objTranslateX, objTranslateY);
  if (((mouseX<imageResX/2)&&(objScaleX>0))||((mouseX>imageResX/2)&&(objScaleX<0))) {
    //if ((mouseX<imageResX/2)&&(objScaleX>0)){
   // obj.scale(-1,1); 
   objScaleX *=-1;
  }

  //background(2);
  image(img, 0, 0);
  if ((mouseX<imageResX)&&(mouseY<imageResY)) {

    drawGlitter();
  }

  //noLoop();
  popMatrix();
  //clear();
}

void drawGlitter() {
  //  if (mouseX<imageResX/2)
  //obj.scale(-1,1);
  drawGlitterShapes();
  pushMatrix();
  translate(mouseX, mouseY);

  stroke(255, 80);
  obj.draw();


  popMatrix();
}



void drawGlitterShapes() {
  //println("glitter "+ glitterShapes.size());
  if (!glitterShapes.isEmpty())
    for (int i=0; i< glitterShapes.size(); i++) {
      glitterShapes.get(i).drawMoreGlitter();
    }
}
