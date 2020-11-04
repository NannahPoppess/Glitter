import geomerative.*; //<>// //<>//

RShape obj;
boolean ignoringStyles = false;

float density =1.0; //gestosc brokatu

String SVGnum = "1.svg";
float objScale =.25;
int objTranslate=40;

float theta;   
color c1;
color c2;

PImage img;
ArrayList<GlitterShape> glitterShapes;

void setup() {
  colorMode(HSB);
  rectMode(CENTER);
  imageMode(CENTER);
  size(1800, 1800);

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

  img = loadImage("photo.jpg"); 
  img.resize(2666, 4000);
}

void draw() {
  obj = RG.loadShape(SVGnum);

  obj.centerIn(g, 1, 1, 1);
  obj.scale(objScale, objScale);
  obj.translate(40, 40);


  //background(2);
  image(img, width/2+100, height/2-400);
  drawGlitter();
  frameRate(60);
  stroke(250);      
  //rect(0, 0, width,height); 
  float a = ( mouseX / (float) width/2) * 720f; 
  // println(a);
  theta = radians(a);  
  translate(width/2, height);  
  line(0, 0, 0, 900);  
  translate(0, -400);  
 // branch(400);
  //noLoop();
}

void drawGlitter() {
  drawGlitterShapes();
  pushMatrix();
  translate(mouseX, mouseY);

stroke(255,30);
  obj.draw();

 
  popMatrix();
}

void mouseClicked() {
  int x=mouseX;
  int y=mouseY;
  GlitterShape g= new GlitterShape(x, y, density, SVGnum, objScale);
  glitterShapes.add(g);
}

void drawGlitterShapes() {
  //println("glitter "+ glitterShapes.size());
  if (!glitterShapes.isEmpty())
    for (int i=0; i< glitterShapes.size(); i++) {
      glitterShapes.get(i).drawGlitter();
    }
}

void branch(float h) {  
  h *= 0.55;  
  if (h > 8) {
    //pushMatrix();    
    //rotate(theta);  
    //c1=#008080;
    //c2=#2e4874;
    //stroke(random(180, 200),random(100, 255),255);
    //point( 0, -h);  
    //translate(0, -h); 
    //branch(h-2);       
    //popMatrix();         

    pushMatrix();
    rotate(-theta);
    stroke(random(160, 180), random(100, 255), 255);
    point( 0, -h);
    translate(0, -h);
    branch(h-2);
    popMatrix();

    //pushMatrix();
    //rotate(theta);
    //stroke(random(140, 160),random(100, 255),255);
    //point( h,  0);
    //translate(h, 0);
    //branch(h);
    //popMatrix();

    pushMatrix();
    rotate(-theta);
    stroke(random(240, 310), random(100, 255), 255);
    point( -h, 0);
    translate(-h, 0);
    branch(h);
    popMatrix();
  }
}
void keyPressed() {
  if (key=='+'){
    density+=1;
        println(density);}
  if (key=='-'){
    density-=1;
    println(density);}

  if (key=='1') {
    SVGnum = "1.svg";
    objScale=.25;
  }

  if (key=='2') {
    SVGnum = "2.svg";
    objScale=.125;
  }

  if (key=='3') {
    SVGnum = "3.svg";
    objScale=.125;
  }
  if (key=='4') {
    SVGnum = "4.svg";
    objScale=.15;
  }

  if (key=='5') {
    SVGnum = "5.svg";
    objScale=.125;
  }
  if (key=='6') {
    SVGnum = "6.svg";
    objScale=.1;
  }

  if (key=='7') {
    SVGnum = "7.svg";
    objScale=.065;
  }

  if (key=='8') {
    SVGnum = "8.svg";
    objScale=.075;
  }

  if (key=='9') {
    SVGnum = "9.svg";
    objScale=.075;
  }

  if (key=='0') {
    SVGnum = "10.svg";
    objScale=.25;
  }

  if (key=='`') {
    SVGnum = "11.svg";
    objScale=.05;
  }

  if (key=='=') {
    SVGnum = "12.svg";
    objScale=.1;
  }
}
