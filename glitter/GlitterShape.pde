class GlitterShape {
  float gWidth;
  float gHeight;
  int posX;
  int posY;

  float glitterNum;

  RShape obj;

  ArrayList<float[]> pointsPos;

  GlitterShape(int x, int y, float density, String SVGnum, float obS) {
    obj = RG.loadShape(SVGnum);
    pointsPos = new ArrayList();
    obj.centerIn(g, 1, 1, 1);
    obj.scale(obS, obS);
    obj.translate(40, 40);
    this.posX=x;
    this.posY=y;
    glitterNum = obj.width*obj.height/100*density;
    println("num "+ glitterNum);
    gWidth=obj.width+80;
    gHeight=obj.height;
    addGlitter();
  }

  void drawGlitter() {

    pushMatrix();
    translate(posX, posY);

    //obj.draw();
    //translate(-gWidth/2, -gHeight/2+20);
    for (int i=0; i<pointsPos.size(); i++) {
        strokeWeight(1);
      stroke(random(180, 220), random(100, 255), 255);
      point(pointsPos.get(i)[0], pointsPos.get(i)[1]);
    }
    //RPoint p = new RPoint(mouseX-width/2, mouseY-height/2);
    //for (int i=0; i<obj.countChildren(); i++) {
    //  if (obj.children[i].contains(p)) {
    //    RG.ignoreStyles(true);
    //    fill(0, 100, 255, 250);
    //    noStroke();
    //    obj.children[i].draw();
    //    RG.ignoreStyles(ignoringStyles);
    //  }
    // }
    popMatrix();
  }
  void addGlitter() {
    int i=0; 
    while (i<glitterNum) {
      float tab[] ={random(-gWidth,gWidth), random(-gHeight/2,gHeight)};

      RPoint p = new RPoint(tab[0], tab[1]);
      if (obj.contains(p)) {
        pointsPos.add(tab);
        i++;
      }
    }
  }
}
