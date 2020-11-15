class Button {

  String name;
  String SVGnum;
  float defaultScale;
  PImage[] images;
  PImage[] imagesAlt;
  char keyCh;
  char keyCh2;
  String label;
  String function;

  Button(String name, String SVGnum, float defaultScale, String[] imgs, String keyCh, String fun, String label) {
    this.name=name;
    this.SVGnum = SVGnum;
    this.defaultScale = defaultScale;
    images=loadImages(imgs);
    this.keyCh = keyCh.charAt(0);
    this.function = fun;
    this.label = label;
  }

  Button(String name, float defaultScale, String[] imgs, String keyCh1, String keyCh2, String fun, String label) {
    this.name=name;
    this.defaultScale = defaultScale;
    images=loadImages(imgs);
    this.keyCh = keyCh1.charAt(0);
    this.keyCh2 = keyCh2.charAt(0);
    this.function = fun;
    this.label = label;
  }
  Button(String name, String[] imgs, String keyCh, String fun, String label) {
    this.name=name;
    images=loadImages(imgs);
    this.keyCh = keyCh.charAt(0);
    this.function = fun;
    this.label = label;
  }
  Button(String name, String[] imgs, String[] imgsAlt, String keyCh, String fun, String label) {
    this.name=name;
    images=loadImages(imgs);
    imagesAlt=loadImages(imgsAlt);
    this.keyCh = keyCh.charAt(0);
    this.function = fun;
    this.label = label;
  }


  void createButton(int posX, int posY, int id) { 
    cp5.addButton(name)
      // .setValue(128)
      .setPosition(posX, posY)
      .setImages(images[0], images[1], images[2])
      .updateSize()
      .setId(id)
      .plugTo( this, function )
      ;
  }

  void createButtonToggle(int posX, int posY, int id) { 
    cp5.addToggle(name)
      // .setValue(128)
      .setPosition(posX, posY)
      .setImages(images[0], images[1], imagesAlt[2], imagesAlt[2])
      .updateSize()
      .setId(id)
      .plugTo( this, function )
      .setValue(false)
      ;
  }

  PImage[] loadImages(String[] imgs) {
    PImage[] images = new PImage[imgs.length];
    for (int i=0; i<imgs.length; i++)
    {
      images[i]=loadImage(imgs[i]);
    }
    return images;
  }

  void saveImage() {
    PImage partialSave = get(0, 0, imageResX, imageResY);
    String name = "image"+frameCount+".png";
    partialSave.save(name);
  }

  void turnOffGlitter() {
    drawGlitterFlag=(!drawGlitterFlag);
  }
}
void controlEvent(ControlEvent theEvent) {
  /* events triggered by controllers are automatically forwarded to 
   the controlEvent method. by checking the id of a controller one can distinguish
   which of the controllers has been changed.
   */
  println("got a control event from controller with id "+theEvent.getController().getId());
  for (int i=0; i<buttons.length; i++) {
    if (theEvent.getController().getId()==i+1)
      SVGnum=buttons[i].SVGnum;
  }
  if (theEvent.getController().getId()==31)
    ui.value = 0.12;
  cp5.get("density").setValue(ui.value);

  //if (theEvent.getController().getName().equals("bGlitterOff")) {    
  //  for (int i=0; i<buttons.length; i++) {
  //    if ((drawGlitterFlag))
  //      cp5.get(Toggle.class, "bGlitterOff").setValue(false);
  //    //cp5.get(Button.class,"bGlitterOff").setImage(otherButtons[i].imagesAlt[0], otherButtons[i].imagesAlt[1], otherButtons[i].imagesAlt[2]);
  //    else if ((otherButtons[i].name == "bGlitterOff")&&(!drawGlitterFlag))
  //    cp5.get(Toggle.class, "bGlitterOff").setValue(true);
  //      //((Button)cp5.get(Button.class,"bGlitterOff")).setImages(otherButtons[i].images[0], otherButtons[i].images[1], otherButtons[i].images[2]);
  //    }
  //  }
  }
