float xC;

void setup(){
  size(960,540);
  xC = width/2;
  Vector root = new Vector(xC, 500, "root");
  Vector top = new Vector(root.x, random(25,200), "top");
  Vector pubic = new Vector(root.x, avg(root.y,top.y)+(random(-20,20)),"pubic");
  Vector groin = new Vector(xC,scaleAvg(pubic.y,root.y,0.1),"groin");
  Vector neckBase = new Vector(root.x, (pubic.y+top.y)*0.45,"neckBase");
  Vector shoulder = new Vector(root.x-(avg(root.y,top.y)*random(.1,.2)),avg(pubic.y,top.y),"shoulder");
  Vector hip = new Vector(root.x-(avg(root.y,top.y)*random(.1,.2)),pubic.y+random(-30,10),"hip");
  Vector knee = new Vector(scaleAvg(xC,hip.x,random(0.8,1)),avg(root.y,pubic.y),"knee");
  Vector thigh = new Vector(scaleAvg(hip.x,avg(hip.x,knee.x),random(-.2,1)),avg(hip.y,knee.y),"thigh");
  Vector inKnee = new Vector(scaleAvg(knee.x,xC,random(0.6,.8)),knee.y+random(5,10),"inKnee");
  Vector foot = new Vector(xC-(random(40,80)),root.y,"foot");
  Vector ankle = new Vector(inKnee.x,scaleAvg(knee.y,foot.y,random(0.65,0.7)),"ankle");
  Vector outAnkle = new Vector(avg(ankle.x,foot.x),scaleAvg(ankle.y,foot.y,random(0.25,0.5)),"outAnkle");
  Vector heel = new Vector(ankle.x,foot.y,"heel");
  Vector calf = new Vector(avg(inKnee.x,xC),avg(inKnee.y,ankle.y),"calf");
  Vector outCalf = new Vector(knee.x,avg(inKnee.y,calf.y),"outCalf");
  Vector waist = new Vector(scaleAvg(shoulder.x,hip.x,random(-.25,1.25)),scaleAvg(shoulder.y,hip.y,0.7),"waist");
  Vector wrist = new Vector(shoulder.x-(xC-shoulder.x),avg(shoulder.y,root.y),"wrist");
  Vector elbow = new Vector(scaleAvg(shoulder.x,wrist.x,0.7),scaleAvg(shoulder.y,wrist.y,0.5),"elbow");
  Vector inElbow = new Vector(scaleAvg(shoulder.x,wrist.x,0.3),scaleAvg(shoulder.y,wrist.y,0.55),"inElbow");
  Vector hand = new Vector(avg(elbow.x,wrist.x),elbow.y+((wrist.y-elbow.y)*1.5),"hand");
  Vector thumbJoin = new Vector(avg(hand.x,inElbow.x),scaleAvg(wrist.y,hand.y,0.3),"thumbJoin");
  Vector neckWid = new Vector(scaleAvg(shoulder.x,xC,0.6),avg(shoulder.y,neckBase.y),"neckWid");
  Vector headWid = new Vector(scaleAvg(shoulder.x,xC,0.4),top.y+10,"headWid");
  Vector jaw = new Vector(scaleAvg(headWid.x,xC,0.05),scaleAvg(top.y,neckBase.y,0.75),"jaw");
  Vector chin = new Vector(xC,avg(jaw.y,neckBase.y),"chin");
  Vector eye = new Vector(scaleAvg(headWid.x,xC,random(0.4,0.6)),scaleAvg(top.y,chin.y,random(0.4,0.6)),"eye");
  Vector cup = new Vector(scaleAvg(shoulder.x,neckWid.x,random(0.4,0.6)),scaleAvg(shoulder.y,waist.y,random(0.4,0.6)),"cup");
  Vector sPlexus = new Vector(xC,scaleAvg(pubic.y,neckBase.y,random(0.5,0.65)),"sPlexus");
  Vector navel = new Vector(xC,avg(sPlexus.y,pubic.y),"navel");
  
  float skinR = random(100,200);
  float skinG = random(50,90);
  float skinB = random(50,90);
  noStroke();
  fill(skinR+random(25,55),skinG+random(25,55),skinB+random(25,55));
  //draw torso
  quad(neckBase.x,neckBase.y,shoulder.x,shoulder.y,waist.x,waist.y,neckBase.x,waist.y);
  quad(waist.x,waist.y,hip.x,hip.y,groin.x,groin.y,neckBase.x,waist.y);
  //draw head
  quad(top.x,top.y,headWid.x,headWid.y,jaw.x,jaw.y,chin.x,chin.y);
  //draw leg
  quad(hip.x,hip.y,thigh.x,thigh.y,knee.x,knee.y,groin.x,groin.y);
  triangle(groin.x,groin.y,knee.x,knee.y,inKnee.x,inKnee.y);
  quad(knee.x,knee.y,outCalf.x,outCalf.y,calf.x,calf.y,inKnee.x,inKnee.y);
  quad(outCalf.x,outCalf.y,outAnkle.x,outAnkle.y,ankle.x,ankle.y,calf.x,calf.y);
  //draw foot
  quad(ankle.x,ankle.y,outAnkle.x,outAnkle.y,foot.x,foot.y,heel.x,heel.y);
  //draw arm
  quad(shoulder.x,shoulder.y,elbow.x,elbow.y,inElbow.x,inElbow.y,cup.x,cup.y);
  triangle(elbow.x,elbow.y,wrist.x,wrist.y,inElbow.x,inElbow.y);
  //draw hand
  //triangle(wrist.x,wrist.y,hand.x,hand.y,thumbJoin.x,thumbJoin.y);
  //draw neck
  quad(neckWid.x,jaw.y,xC,chin.y,xC,neckBase.y,neckWid.x,neckWid.y);
  
  fill(skinR-random(25,55),skinG-random(25,55),skinB,80-random(25,55));
  //draw groin area
  triangle(hip.x,hip.y,pubic.x,pubic.y,groin.x,groin.y);
  
  //draw inner thigh
  quad(pubic.x,pubic.y,knee.x,knee.y,calf.x,calf.y,inKnee.x,inKnee.y);
  
  //draw underarm
  triangle(shoulder.x,shoulder.y,inElbow.x,inElbow.y,cup.x,cup.y);
  
  //draw underboob
  quad(shoulder.x,shoulder.y,cup.x,cup.y,sPlexus.x,sPlexus.y,cup.x,cup.y-5);
  
  //draw ankle shadow
  quad(calf.x,calf.y,outAnkle.x,outAnkle.y,heel.x,heel.y,ankle.x,ankle.y);
  
  //draw navel
  ellipse(navel.x,navel.y,random(2,8),random(2,8));
  
  //draw eye
  triangle(eye.x,eye.y,eye.x-random(5,10),eye.y-random(2,8),eye.x+random(5,10),eye.y-random(2,8));
  
  mirrorImage();
  save("hero.jpg");
}

void draw(){
  
}

float avg(float a, float b){
  return (a+b)/2; 
}

float scaleAvg(float a, float b, float z){
  return a+(b-a)*z; 
}

void mirrorImage(){
  loadPixels();
  for (int i = 0; i < height;i++){
    for (int j = 0; j < width/2; j++){
      int thisPix = (i*width)+j;
      int thatPix = (i*width)+(width-j)-1;
      pixels[thatPix] = pixels[thisPix];
    }
  }
  updatePixels(); 
}

class Vector {
  float x, y;
  Vector (float a, float b, String s) {
    x = a;
    y = b;
    //ellipse(x,y,10,10);
    //ellipse(xC+(xC-x),y,10,10);
    //text(s, x+10, y+4);
  }
}