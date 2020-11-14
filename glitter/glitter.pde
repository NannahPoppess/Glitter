import controlP5.*; //<>// //<>// //<>// //<>//
import geomerative.*;


ControlP5 cp5;

JSONObject json;

RShape obj;
boolean ignoringStyles = false;

float density =0.12; //gestosc brokatu

String SVGnum = "SVG/10.svg";
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
   loadData();
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
  ui.showLabelsOnHover();
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

Button[] buttons;
Button[] otherButtons;
void loadData() {
  // Load JSON file
  // Temporary full path until path problem resolved.
  json = loadJSONObject("shapeButtons.json");

  JSONArray buttonsData = json.getJSONArray("buttons");
  buttons= new Button[buttonsData.size()];
  for (int i = 0; i < buttonsData.size(); i++) {
    // Get each object in the array
    JSONObject button = buttonsData.getJSONObject(i); 
    String name = button.getString("name");
    String SVGNum = button.getString("SVGnum");
    float defaultScale = button.getFloat("defaultScale");
    String[] imgs ={button.getString("buttonImg"), button.getString("buttonImgActive"), button.getString("buttonImgClicked") }; //<>//
    String keyCh = button.getString("key");     //<>//
    String label = button.getString("label");

    // Put object in array
    buttons[i] = new Button(name, SVGNum, defaultScale, imgs, keyCh, label);
  }
  json = loadJSONObject("functionalButtons.json");
    buttonsData = json.getJSONArray("buttons");
   otherButtons= new Button[buttonsData.size()];
  for (int i = 0; i < buttonsData.size(); i++) {
    JSONObject button = buttonsData.getJSONObject(i); 
    String name = button.getString("name");
    float defaultDensity = button.getFloat("defaultDensity");
    String[] imgs ={button.getString("buttonImg"), button.getString("buttonImgActive"), button.getString("buttonImgClicked") };
    String keyCh1 = button.getString("key1");
    String keyCh2 = button.getString("key2");    
    String label = button.getString("label");
    otherButtons[i] = new Button(name, defaultDensity, imgs, keyCh1, keyCh2, label);}
}
