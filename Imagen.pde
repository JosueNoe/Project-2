void Polla(){
    
  PollaImage.noStroke();
  PollaImage.beginDraw();
  
  PollaImage.fill(233,199,181);
  PollaImage.noStroke();
  PollaImage.ellipse(50,20,32,20);
  PollaImage.ellipse(40,28,28,28);
  PollaImage.ellipse(60,28,28,28);
  PollaImage.rect(32,36,36,72);
  PollaImage.ellipse(60,108,40,40);
  PollaImage.ellipse(32,108,40,40);
  
  PollaImage.fill(0);
  PollaImage.ellipse(42,60,4,8);
  PollaImage.ellipse(50,60,4,8);
  
  PollaImage.fill(250);
  PollaImage.ellipse(46,72,12,4);
  
    PollaImage.endDraw();
  image(PollaImage,random(5),random(5));
}

//Esta vez trate de usar PGraphics en vez de Switch pero no funciono :(