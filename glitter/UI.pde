class UI {
  float n, n1;

  float value;
  String prefix;

  UI( String thePrefix) {
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

    PImage[] imgs = {loadImage("b1.png"), loadImage("b2.png"), loadImage("b3.png"), 
      loadImage("b4.png"), loadImage("b5.png"), loadImage("b6.png"), loadImage("b7.png"), 
      loadImage("b8.png"), loadImage("b9.png"), loadImage("b10.png"), loadImage("b11.png"), loadImage("b12.png")};
    for (int i=0; i<imgs.length; i++) {
      cp5.addButton("b"+i+1)
        .setValue(128)
        .setPosition(1500, 105*i)
        .setImage(imgs[i])
        .updateSize()
        .setId(i+1)
        .plugTo( this, "setShape" )
        ;
    }
  }

  void setDensity(float theValue) {
    value = theValue;
  }

  void setShape() {
  }

  void createDensitySlider() {
    cp5.addSlider( "density-"+prefix )
      .setRange( 0.01, .48 )
      .plugTo( this, "setDensity" )
      .setValue( 0.12 )
      .setLabel("density")
      .setPosition(100, 1525)
      .setSize(300, 50)
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



  // function colorA will receive changes from 
  // controller with name colorA
  public void colorA(int theValue) {
    println("a button event from colorA: "+theValue);
    c1 = c2;
    c2 = color(0, 160, 100);
  }

  // function colorB will receive changes from 
  // controller with name colorB
  public void colorB(int theValue) {
    println("a button event from colorB: "+theValue);
    c1 = c2;
    c2 = color(150, 0, 0);
  }

  // function colorC will receive changes from 
  // controller with name colorC
  public void colorC(int theValue) {
    println("a button event from colorC: "+theValue);
    c1 = c2;
    c2 = color(255, 255, 0);
  }

  public void play(int theValue) {
    println("a button event from buttonB: "+theValue);
    c1 = c2;
    c2 = color(0, 0, 0);
  }

  void controlEvent(ControlEvent theEvent) {
    /* events triggered by controllers are automatically forwarded to 
     the controlEvent method. by checking the id of a controller one can distinguish
     which of the controllers has been changed.
     */
    println("got a control event from controller with id "+theEvent.getController().getId());
    switch(theEvent.getController().getId()) {
      case(1):
      SVGnum="1.svg";
      break;

      case(2):
      SVGnum="2.svg";
      break;

      case(3):
      SVGnum="3.svg";
      break;

      case(4):
      SVGnum="4.svg";
      break;

      case(5):
      SVGnum="5.svg";
      break;

      case(6):
      SVGnum="6.svg";
      break;

      case(7):
      SVGnum="7.svg";
      break;

      case(8):
      SVGnum="8.svg";
      break;

      case(9):
      SVGnum="9.svg";
      break;

      case(10):
      SVGnum="10.svg";
      break;

      case(11):
      SVGnum="11.svg";
      break;

      case(12):
      SVGnum="12.svg";
      break;
    }
  }
}

void keyPressed() {
  if (key=='+') {
    density+=.04;
    println(density);
  }
  if (key=='-') {
    density-=.04;
    println(density);
  }

  if (key=='1') {
    SVGnum = "1.svg";
    objScaleX=.11;
    objScaleY=.11;
  }

  if (key=='2') {
    SVGnum = "2.svg";
    objScaleX=.07;
    objScaleY=.07;
  }

  if (key=='3') {
    SVGnum = "3.svg";
    objScaleX=.07;
    objScaleY=.07;
  }
  if (key=='4') {
    SVGnum = "4.svg";
    objScaleX=.09;
    objScaleY=.09;
  }

  if (key=='5') {
    SVGnum = "5.svg";
    objScaleX=.06;
    objScaleY=.06;
  }
  if (key=='6') {
    SVGnum = "6.svg";
    objScaleX=.04;
    objScaleY=.04;
  }

  if (key=='7') {
    SVGnum = "7.svg";
    objScaleX=.04;
    objScaleY=.04;
  }

  if (key=='8') {
    SVGnum = "8.svg";
    objScaleX=.04;
    objScaleY=.04;
  }

  if (key=='9') {
    SVGnum = "9.svg";
    objScaleX=.04;
    objScaleY=.04;
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
  if (key==']') {
    SVGnum = "10.svg";
    objScaleX=.075;
    objScaleY=.075;
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
    if((objScaleX>0)&&(mouseX>imageResX/2))
    objScaleX += e;
    else
    objScaleX -= e;
    objScaleY += e;
    
    if (objScaleY<0.4){
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
