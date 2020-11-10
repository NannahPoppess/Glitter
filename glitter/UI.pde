class UI {

  int value;

  UI( String thePrefix ) {
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
}
