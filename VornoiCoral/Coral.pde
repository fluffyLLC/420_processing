class Coral {

  PVector origin;
  int spoungeRadius = 25;
  int minCellRadius = 3;
  int currentCell = 0;
  //int maxCellRadius = 3;

  float pointLimit;
  float currentPointArea; 
  float pointMod;
  
  boolean drawCellPoints = true;


  ArrayList<PVector> cellPoints = new ArrayList<PVector>();
  ArrayList<PVector[]> cellVert = new ArrayList<PVector[]>();

  Coral() {
    origin = new PVector(0, 0, 0);
    pointLimit = 4*PI*(spoungeRadius*spoungeRadius);
    pointMod = 2*PI*(minCellRadius*minCellRadius);
    println(pointLimit);
    println(pointMod);
  }

  void update() {
    if (currentPointArea < pointLimit) {
      GenerateCellPoints();
    }else{
    GenerateCellVerts();
    
    }
  }

  void draw() {

    

    if (drawCellPoints) {
      stroke(255);
      for (int i = cellPoints.size()-1; i >=0; i--) {
        PVector p = cellPoints.get(i);
        point(p.x, p.y, p.z);
      }
    }

  }

  void GenerateCellPoints() {

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
  
  void GenerateCellVerts(){
    
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
