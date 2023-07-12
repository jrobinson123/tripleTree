
TripleTree tt;


void setup(){
  size(450, 800);
  tt = new TripleTree(1.0);
}

void draw(){
  background(0);
  tt.show();
  tt.update();
}
