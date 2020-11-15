class UI {
  float n, n1;

  float value;
  String prefix;
  PFont font;

  UI( String thePrefix) {
    font = createFont("foglihten-font/Foglihten-nYZP.otf", 24);
    textFont(font);
    this.prefix = thePrefix;
    createDensitySlider();
    drawUIBackground();
    
    for (int i=0; i<buttons.length; i++) {
      buttons[i].createButton(imageResX, 105*i, i+1);
    }
    for (int i=0; i<otherButtons.length; i++) {
      if (i==0)
      otherButtons[i].createButton(0, imageResY, i+31);
      else if (i==2)
      otherButtons[i].createButtonToggle(imageResX-(i*105)+5, imageResY, i+31);
      else
      otherButtons[i].createButton(imageResX-(i*100), imageResY, i+31);
    }
  }

  void setDensity(float theValue) {
    value = theValue;
  }


  void createDensitySlider() {
    cp5.addSlider( "density" )
      .setRange( 0.01, .48 )
      .plugTo( this, "setDensity" )
      .setValue( 0.12 )
      .setLabel("density")
      .setPosition(105, 1500)
      .setSize(300, 100)
      .setColorForeground(color(185, 150, 250))
      .setColorBackground(color(185, 150, 80))
      .setColorActive(color(185, 100, 250))
      .setId(30)
      ;
  }
  
  void drawUIBackground() {
    fill(0, 0, 20);
    stroke(0, 0, 15);
    strokeWeight(7);
    rect(0, imageResY-1, imageResX, (height-imageResX)-1);
    rect(imageResX-1, 0, (width-imageResX), height);
  }
  int mover=-1;
  void showLabelsOnHover() {
    noStroke();
    //  mover=-1;
    if (cp5.isMouseOver(cp5.getController("density"))) {

      if (mover+1500>1455) {
        fill(0, 0, 19);
        rect(105, 1500+mover, 300, 45);
        // fill(255);
        text("Change density of glitter", 125, 1530+mover);
        mover--;
      } else
        fill(0, 0, 19);
      rect(105, 1500+mover, 300, 45);
      fill(255);
      text("Change density of glitter", 125, 1530+mover);
      fill(0, 0, 19);
    } else
      mover=-1;
  }
}

void keyPressed() {
  if (key=='+') {
    ui.value+=.02;
    cp5.get("density").setValue(ui.value);
    println(ui.value);
  }
  if (key=='-') {
    ui.value-=.02;
    cp5.get("density").setValue(ui.value);
    println(ui.value);
  }
  for (int i=0; i<buttons.length; i++) {

    if (key==buttons[i].keyCh) {
      SVGnum = buttons[i].SVGnum;
      objScaleX=buttons[i].defaultScale;
      objScaleY=buttons[i].defaultScale;
    }
  }
}
float e;
void mouseWheel(MouseEvent event) {

  // if ((event.getCount()==(-1.0))&&((objScaleY<=0.65)&&(objScaleY>=-0.65))){
  // e += 0.05*event.getCount();
  //    objScaleX += e;
  //objScaleY += e;}
  //  while ( objScaleY<0.5){
  //if (objScaleY<0.4) {
  e += 0.005*event.getCount();
  println(e);
  if ((objScaleX>0)&&(mouseX>imageResX/2))
    objScaleX += e;
  else
    objScaleX -= e;
  objScaleY += e;

  if (objScaleY<0.4) {
    e=0;
  }
  //}
  //if((objScaleY==0.4)&&(event.getCount()==(-1.0))){
  //  if(objScaleY>-.04){
  //    e += 0.05*event.getCount();
  // objScaleX += e;
  //objScaleY += e;}}
  println("X "+objScaleX);
  println("Y "+objScaleY);
}

void mouseClicked() {
  int x=mouseX;
  int y=mouseY;

  if ((x<imageResX)&&(y<imageResY)) {
    density =ui.value;
    GlitterShape g= new GlitterShape(x, y, density, SVGnum, objScaleX, objScaleY);
    glitterShapes.add(g);
  }
}
Button[] buttons;
Button[] otherButtons;
void loadData() {
  // Load JSON file
  // Temporary full path until path problem resolved.

 buttons= loadJSON("shapeButtons.json", "buttons");
 otherButtons= loadJSON("functionalButtons.json", "buttons");


}

Button[] loadJSON(String fileName, String arrayName) {
  Button[] buts;
  json = loadJSONObject(fileName);

  JSONArray buttonsData = json.getJSONArray(arrayName);
  buts= new Button[buttonsData.size()];
  for (int i = 0; i < buttonsData.size(); i++) {
    // Get each object in the array
    JSONObject button = buttonsData.getJSONObject(i); 
    String name = button.getString("name");
    String SVGNum;
    float defaultScale;

    String[] imgs ={button.getString("buttonImg"), button.getString("buttonImgActive"), button.getString("buttonImgClicked") };
    String keyCh = button.getString("key");
    String keyCh2;

    String function = button.getString("function"); 
    String label = button.getString("label");

    if ( button.hasKey("SVGnum")) {
      SVGNum = button.getString("SVGnum");
     defaultScale = button.getFloat("defaultScale");
      buts[i] = new Button(name, SVGNum, defaultScale, imgs, keyCh, function, label);
    }

    else if ( button.hasKey("key2")) {
      keyCh2 = button.getString("key2"); 
     defaultScale = button.getFloat("defaultDensity");
      buts[i] = new Button(name, defaultScale, imgs, keyCh, keyCh2, function, label);
    }
    else if(button.hasKey("buttonImgAlt")){
    String[] imgsAlt ={button.getString("buttonImg"), button.getString("buttonImgActive"), button.getString("buttonImgClicked") };
    buts[i] = new Button(name, imgs, imgsAlt, keyCh, function, label);
    }
    // Put object in array
    else  
    buts[i] = new Button(name, imgs, keyCh, function, label);
  }
  return buts;
}
