class Button {

  String name;
  String SVGnum;
  float defaultScale;
  PImage[] images;
  char keyCh;
    char keyCh2;
  String label;


  Button(String name, String SVGnum, float defaultScale, String[] imgs, String keyCh, String label) {
    this.name=name;
    this.SVGnum = SVGnum;
    this.defaultScale = defaultScale;
   loadImages(imgs);
    this.keyCh = keyCh.charAt(0);
    this.label = label;

  }
  
   Button(String name, float defaultScale, String[] imgs, String keyCh1, String keyCh2, String label) {
    this.name=name;
    this.defaultScale = defaultScale;
   loadImages(imgs);
    this.keyCh = keyCh1.charAt(0);
    this.keyCh2 = keyCh2.charAt(0);
    this.label = label;

  }


  void createButton(int posX, int posY, int id, String fun) { 
    cp5.addButton(name)
      // .setValue(128)
      .setPosition(posX, posY)
      .setImages(images[0], images[1], images[2])
      .updateSize()
      .setId(id)
      .plugTo( this, fun )
      ;
  }

  void loadImages(String[] imgs) {
    images = new PImage[imgs.length];
    for (int i=0; i<imgs.length; i++)
    {
      images[i]=loadImage(imgs[i]);
    }
  }
}
 void controlEvent(ControlEvent theEvent) {
    /* events triggered by controllers are automatically forwarded to 
     the controlEvent method. by checking the id of a controller one can distinguish
     which of the controllers has been changed.
     */
    println("got a control event from controller with id "+theEvent.getController().getId());
      for (int i=0; i<buttons.length;i++)    {
        if(theEvent.getController().getId()==i+1)
      SVGnum=buttons[i].SVGnum;
    }
       if(theEvent.getController().getId()==31)
      ui.value = 0.12;
      cp5.get("density").setValue(ui.value);
  }
