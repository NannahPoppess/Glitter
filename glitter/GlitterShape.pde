class GlitterShape { //<>//
  float gWidth;
  float gHeight;
  int posX;
  int posY;
  int counter =0;

  float glitterNum;

  RShape obj;

  ArrayList<float[]> pointsPos;

  GlitterShape(int x, int y, float density, String SVGnum, float obSX, float obSY) {
    obj = RG.loadShape(SVGnum);
    pointsPos = new ArrayList();
    obj.centerIn(g, 1, 1, 1);
    obj.scale(obSX, obSY);
    obj.translate(40, 40);
    this.posX=x;
    this.posY=y;
    glitterNum = obj.getWidth()*obj.getHeight()*density*(50*obSY);
    println("num "+ glitterNum);
    gWidth=obj.width+80;
    gHeight=obj.height;
    addGlitter();
  }

  void drawGlitter() {
    color c=color(255);
    pushMatrix();
    translate(posX-objTranslateX, posY-objTranslateY);
    
    for (int i=0; i<pointsPos.size(); i++) {
      strokeWeight(.75);
      if ((i%2==0)||(i==0))
        c =img.get((int)(pointsPos.get(i)[0]+posX-objTranslateX), (int)(pointsPos.get(i)[1])+posY-objTranslateY);

      stroke(random(hue(c)*.9, hue(c)), random(saturation(c)-80, saturation(c)-40), random(brightness(c)+10, brightness(c)+100));
      //stroke(random(0, 50), random(saturation(c)+30, saturation(c)+60), random(brightness(c)+10, brightness(c)+100));
      point(pointsPos.get(i)[0], pointsPos.get(i)[1]);
    }
    popMatrix();
  }
  void addGlitter() {
    int i=0; 
    while (i<glitterNum) {
      float tab[] ={random(-gWidth, gWidth), random(-gHeight/2, gHeight)};

      RPoint p = new RPoint(tab[0], tab[1]);
      if (obj.contains(p)) {
        pointsPos.add(tab);
        //println("x: "+(pointsPos.get(i)[0]+posX)+" y: "+ (pointsPos.get(i)[1])+posY);
        i++;
      }
    }
  }

  void drawMoreGlitter() {
    color c=color(255);
    pushMatrix();
    translate(posX-objTranslateX, posY-objTranslateY);
    if (counter+10<pointsPos.size()) {
      for (int i=0; i<counter+10; i++) {
        strokeWeight(.75);
        if ((i%2==0)||(i==0))
          c =img.get((int)(pointsPos.get(i)[0]+posX-objTranslateX), (int)(pointsPos.get(i)[1])+posY-objTranslateY);

        stroke(random(hue(c)*.9, hue(c)), random(saturation(c)-80, saturation(c)-40), random(brightness(c)+10, brightness(c)+100));
        //stroke(random(0, 50), random(saturation(c)+30, saturation(c)+60), random(brightness(c)+10, brightness(c)+100));
        point(pointsPos.get(i)[0], pointsPos.get(i)[1]);
      }
      counter+=10;
    } else 
    for (int i=0; i<pointsPos.size(); i++) {
      strokeWeight(.75);
      if ((i%2==0)||(i==0))
        c =img.get((int)(pointsPos.get(i)[0]+posX-objTranslateX), (int)(pointsPos.get(i)[1])+posY-objTranslateY);
        
      stroke(random(hue(c)*.9, hue(c)), random(saturation(c)-80, saturation(c)-40), random(brightness(c)+10, brightness(c)+100));
      //stroke(random(0, 50), random(saturation(c)+30, saturation(c)+60), random(brightness(c)+10, brightness(c)+100));
      point(pointsPos.get(i)[0], pointsPos.get(i)[1]);
    }
    popMatrix();
  }
}
