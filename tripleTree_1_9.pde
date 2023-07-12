
TripleTree tt;
color[] depthColors = new color[8];


void setup(){
  size(450, 800);
  for (int i = 0; i < depthColors.length; i++){
  depthColors[i] = color(random(255), random(255), random(255));
  }  
  tt = new TripleTree(1.0);
}

void draw(){
 // background(57, 224, 52);
 background(0);
  tt.show();
  tt.update();
}

void mousePressed(){
  for (int i = 0; i < 100000; i++){
    tt.update();
  }
}
