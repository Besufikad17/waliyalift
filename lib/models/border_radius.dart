class MyBorderRadius {
  double topLeft;
  double topRight;
  double bottomLeft;
  double bottomRight;
  double radius = 0;

  MyBorderRadius({
    this.topLeft = 0, 
    this.topRight = 0, 
    this.bottomLeft = 0, 
    this.bottomRight = 0,
    this.radius = 0
  });

  MyBorderRadius.all({
    this.topLeft = 0, 
    this.topRight = 0, 
    this.bottomLeft = 0, 
    this.bottomRight = 0,
    this.radius = 0
  }) {
    topLeft = radius;
    topRight = radius;
    bottomLeft = radius;
    bottomRight = radius;
  }
}
