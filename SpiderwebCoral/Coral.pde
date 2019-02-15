class Coral {

  PVector origin;
  int spoungeRadius = 25;
  int minCellRadius = 10;
  //int maxCellRadius = 3;

  float pointLimit;
  float currentPointArea; 
  float pointMod;


  ArrayList<PVector> cellPoints = new ArrayList<PVector>();
  ArrayList<PVector> cellVert = new ArrayList<PVector>();

  Coral() {
    origin = new PVector(0, 0, 0);
    pointLimit = 4*PI*(spoungeRadius*spoungeRadius);
    pointMod = 2*PI*(minCellRadius*minCellRadius);
    println(pointLimit);
    println(pointMod);
  }

  void update() {
    if (currentPointArea < pointLimit) {
      GeneratePoints();
    }
  }

  void draw() {

    stroke(255);
    
    //line(0,0,0,50,50,50);
    /*
    for (int i = cellPoints.size()-1; i >=0; i--) {
     PVector p = cellPoints.get(i);
     point(p.x, p.y, p.z);
     }
     */

    for (int i = cellPoints.size()-1; i >=0; i--) {
      PVector p = cellPoints.get(i);
      for (int a = cellPoints.size()-1; a >=0; a--) {
        PVector pv = cellPoints.get(a);
        if (p == pv) continue;
        line(p.x, p.y, p.z, pv.x, pv.y, pv.z);
        
        //println("p.x " + p.x + ", p.y " + p.y + ", p.z " + p.z + ", pv.x " + pv.x + ", pv.y " + pv.y + ", pv.z " + pv.z);
        // point(p.x, p.y, p.z);
      }
    }
  }

  void GeneratePoints() {

    if (cellPoints.size()== 0) {
      //println("works bitch");
      cellPoints.add(getPoint());
      currentPointArea += pointMod;
    } else {
      cellPoints.add(getSpacedPoint());
      currentPointArea += pointMod;
    }
    //generate random angle
    //project along that angle?
    //3d vector feild?
    //no
  }

  PVector getSpacedPoint() {
    PVector newPoint = getPoint();

    for (int i = cellPoints.size()-1; i >=0; i--) {
      if (newPoint.dist(cellPoints.get(i)) < minCellRadius) {
        return getSpacedPoint();
      }
    }
    return newPoint;
  }

  PVector getPoint() {
    //I am generating a point at a given magnitude with a random angle
    //https://www.youtube.com/watch?v=PptiB5H2Qhg
    float swingAngle = random(360); 
    float zAngle = random(360);
    //we will assume z is up for now

    float z = spoungeRadius * cos(zAngle);
    float h = spoungeRadius * sin(zAngle);
    //println(z);
    float x = h * cos(swingAngle);
    float y = h * sin(swingAngle);

    return new PVector(x, y, z);
    //a 3d cartisian vector is made of two cartisian vectors
  }
}
