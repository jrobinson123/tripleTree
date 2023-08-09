# tripleTree
![with color](tripleTree.gif)


A fun variation on a classic binary tree data structure. In my version, each tree has three children instead of two. I then use a novel technique to visualize these 'TripleTrees'.

The core of my program is a TripleTree class. There is only one TripleTree object in the main frame of the program, which has a remarkably simple control loop that simply applies the show and update method of the object. 

```processing
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
```
Every TripleTree object has a few key variables encapsulated in it:
```processing
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
```
left, right, and mid are recursively created TripleTree objects, this recursive pattern is what makes this data structure a tree. maxDepth acts a stop-gap for the recursion, while layer tracks the current layer of recursion a certain object is in. 


