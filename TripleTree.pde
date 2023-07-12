


class TripleTree{
  PVector pos;
  TripleTree left = null;
  TripleTree right = null;
  TripleTree mid = null;
  int layer;
  PVector basis;
  int maxDepth = 7;
  float depth;
  float ySpeed = 10;
  float xSpeed = 10;
  color[] colors;
  
  
  TripleTree(float layer){
    float lowerBound;
    float upperBound;
    if (layer == 1) {
      lowerBound = 0;
      upperBound = 0;
    } else {
       lowerBound = height * (layer - 1)/(maxDepth);
       upperBound = height * (layer)/(maxDepth);
    }
    colors = new color[3];
    for (int i = 0; i < colors.length; i++) {
      colors[i] = color(random(255), random(255), random(255));
    }
   
    pos = new PVector(random(width), random(lowerBound, upperBound));
    if (layer < maxDepth) {
      left = new TripleTree(layer + 1);
      right = new TripleTree(layer + 1);
      mid = new TripleTree(layer + 1);
    }
    depth = layer;
    double randGen = Math.random();
    if (randGen > 0.25) {
       basis = new PVector(xSpeed, ySpeed);
    }else if (randGen > 0.5) {
       basis = new PVector(-xSpeed, ySpeed);
    } else if(randGen > 0.75) {
       basis = new PVector(xSpeed, -ySpeed);
    } else {
       basis = new PVector(-xSpeed, -ySpeed);
    }
    
    
  }
  void show(){
    if (left != null) {
      noFill();
      strokeWeight(1);
      stroke(57, 224, 52, 70);
    //  stroke(colors[0], 70);
      bezier(pos.x, pos.y, left.pos.x, left.pos.y, right.pos.x, right.pos.y, mid.pos.x, mid.pos.y);
     // stroke(colors[1], 70);
      bezier(pos.x, pos.y, mid.pos.x, mid.pos.y, left.pos.x, left.pos.y, right.pos.x, right.pos.y);
    //  stroke(colors[2], 70);
      bezier(pos.x, pos.y, mid.pos.x, mid.pos.y, right.pos.x, right.pos.y, left.pos.x, left.pos.y);
      
      
      strokeWeight(3);
      point(pos.x, pos.y);
      left.show();
      right.show();
      mid.show();
    } 
  }
  void update(){
    pos.add(basis);
    if (pos.x > width) {
      basis.x = -xSpeed;
    } else if (pos.x < 0) {
      basis.x = xSpeed;
    }
    if (pos.y > height) {
      basis.y = -xSpeed;
    } else if (pos.y < 0) {
      basis.y = xSpeed;
    }
    if (left != null) {
      left.update();
      right.update();
      mid.update();
    } 
  }
}
