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

    //   // create a new button with name 'buttonA'
    //cp5.addButton("colorA")
    //   .setValue(0)
    //   .setPosition(100,100)
    //   .setSize(200,19)
    //   ;

    //// and add another 2 buttons
    //cp5.addButton("colorB")
    //   .setValue(100)
    //   .setPosition(100,120)
    //   .setSize(200,19)
    //   ;

    //cp5.addButton("colorC")
    //   .setPosition(100,140)
    //   .setSize(200,19)
    //   .setValue(0)
    //   ;

    //PImage[] imgs = {loadImage("b1.png"), loadImage("b2.png"), loadImage("b3.png"), 
    //  loadImage("b4.png"), loadImage("b5.png"), loadImage("b6.png"), loadImage("b7.png"), 
    //  loadImage("b8.png"), loadImage("b9.png"), loadImage("b10.png"), loadImage("b11.png"), loadImage("b12.png"), loadImage("bDen.png")};
    //for (int i=0; i<imgs.length-1; i++) {
    //  cp5.addButton("b"+i+1)
    //   // .setValue(128)
    //    .setPosition(imageResX, 105*i)
    //    .setImages(imgs[i], imgs[imgs.length-1], imgs[i])
    //    .updateSize()
    //    .setId(i+1)
    //    .plugTo( this, "setShape" )
    //    ;
    //}
    for (int i=0; i<buttons.length; i++) {
      buttons[i].createButton(imageResX, 105*i, i+1, "setShape");
      //cp5.addButton("b"+i+1)
      // // .setValue(128)
      //  .setPosition(imageResX, 105*i)
      //  .setImages(imgs[i], imgs[imgs.length-1], imgs[i])
      //  .updateSize()
      //  .setId(i+1)
      //  .plugTo( this, "setShape" )
      //  ;
    }
    for (int i=0; i<otherButtons.length; i++) {
      otherButtons[i].createButton(0, imageResY, i+31, "setDensity");
    }
    //cp5.addButton("bDen")
    // // .setValue(128)
    //  .setPosition(0, imageResY)
    //  .setImage(imgs[imgs.length-1])
    //  .updateSize()
    //  .setId(31)
    //  .plugTo( this, "setDensity" )
    //  ;
  }

  void setDensity(float theValue) {
    value = theValue;
  }

  void setShape() {
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
