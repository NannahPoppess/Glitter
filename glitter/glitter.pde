import controlP5.*; //<>// //<>//
import geomerative.*;


ControlP5 cp5;


RShape obj;
boolean ignoringStyles = false;

float density =0.24; //gestosc brokatu

String SVGnum = "1.svg";
float objScaleX =.12;
float objScaleY =.12;
int objTranslateX=20;
int objTranslateY=20;

float theta;   
color c1;
color c2;

PImage img;
ArrayList<GlitterShape> glitterShapes;

int imageResX = 1600;
int imageResY = 1600;
Test t;

void setup() {
  frameRate(60);
  colorMode(HSB);
  rectMode(CENTER);
  //imageMode(CENTER);
  size(1800, 1800);
  cp5 = new ControlP5( this );
  t = new Test( "test" );
 // println( t.value );

  // cp5 = new ControlP5(this);

  //// replace the default controlP5 button with an image.
  //// button.setImages(defaultImage, rolloverImage, pressedImage);
  //// use button.updateSize() to adjust the size of the button and 
  //// resize to the dimensions of the defaultImage

  //cp5.addButton("buttonA")
  //   .setPosition(width/2,height/2)
  //   .setSize(50,50)
  //   .updateSize();


  // VERY IMPORTANT: Allways initialize the library before using it
  RG.init(this);
  RG.ignoreStyles(ignoringStyles);

  smooth(8);
  // noCursor();
  strokeWeight(1);
  filter(DILATE);
  RG.ignoreStyles(true);
  noFill();

  glitterShapes = new ArrayList();

  img = loadImage("photo.png"); 
  img.resize(imageResX, imageResY);
}

void draw() {
    stroke(255);  
  pushMatrix();
  obj = RG.loadShape(SVGnum);
    //obj.translate(objTranslateX, objTranslateY);
  obj.centerIn(g, 1, 1, 1);
  obj.scale(objScaleX, objScaleY);
obj.translate(objTranslateX, objTranslateY);
if (((mouseX<imageResX/2)&&(objScaleX>0))||((mouseX>imageResX/2)&&(objScaleX<0))){
  //if ((mouseX<imageResX/2)&&(objScaleX>0)){
objScaleX*=-1; //<>//
}

  //background(2);
  image(img, 0, 0); //<>//
  if ((mouseX<imageResX)&&(mouseY<imageResY)){
    
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

void mouseClicked() {
  int x=mouseX;
  int y=mouseY;

  if ((x<imageResX)&&(y<imageResY)) {

    GlitterShape g= new GlitterShape(x, y, density, SVGnum, objScaleX, objScaleY);
    glitterShapes.add(g);
  }
}

void drawGlitterShapes() {
  //println("glitter "+ glitterShapes.size());
  if (!glitterShapes.isEmpty())
    for (int i=0; i< glitterShapes.size(); i++) {
      glitterShapes.get(i).drawGlitter();
    }
}

void keyPressed() {
  if (key=='+') {
    density+=.06;
    println(density);
  }
  if (key=='-') {
    density-=.06;
    println(density);
  }

  if (key=='1') {
    SVGnum = "1.svg";
    objScaleX=.12;
        objScaleY=.12;
  }

  if (key=='2') {
    SVGnum = "2.svg";
    objScaleX=.075;
    objScaleY=.075;
  }

  if (key=='3') {
    SVGnum = "3.svg";
    objScaleX=.075;
        objScaleY=.075;
  }
  if (key=='4') {
    SVGnum = "4.svg";
    objScaleX=.1;
        objScaleY=.1;
  }

  if (key=='5') {
    SVGnum = "5.svg";
    objScaleX=.075;
        objScaleY=.075;
  }
  if (key=='6') {
    SVGnum = "6.svg";
    objScaleX=.05;
        objScaleY=.05;
  }

  if (key=='7') {
    SVGnum = "7.svg";
    objScaleX=.045;
    objScaleY=.045;
  }

  if (key=='8') {
    SVGnum = "8.svg";
    objScaleX=.05;
    objScaleY=.05;
  }

  if (key=='9') {
    SVGnum = "9.svg";
    objScaleX=.05;
    objScaleY=.05;
  }

  if (key=='0') {
    SVGnum = "11.svg";
    objScaleX=.1;
        objScaleY=.1;
  }
  if (key=='`') {
    SVGnum = "11.svg";
    objScaleX=.03;
        objScaleY=.03;
  }

  if (key=='=') {
    SVGnum = "12.svg";
    objScaleX=.075;
        objScaleY=.075;
  }
}

//public void controlEvent(ControlEvent theEvent) {
//  println(theEvent.getController().getName());

//}

//// function buttonA will receive changes from 
//// controller with name buttonA
//public void buttonA(int theValue) {
//  println("a button event from buttonA: "+theValue);
// // myColor = color(128);
//}


class Test {

  int value;

  Test( String thePrefix ) {
    cp5.addSlider( "value-"+thePrefix )
      .setRange( 0, 255 )
      .plugTo( this, "setValue" )
      .setValue( 127 )
      .setLabel("value")
      .setPosition(100, 1700)
      .setSize(300, 50);
    ;
  }

  void setValue(int theValue) {
    value = theValue;
  }
}
