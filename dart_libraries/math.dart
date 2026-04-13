import 'dart:math';

(double, double) circleStats (radius) {
  double area = pi * pow(radius, 2);
  area = double.parse(area.toStringAsFixed(2));
  double circumference = 2 * pi * radius;
  circumference = double.parse(circumference.toStringAsFixed(2));
  return (area, circumference);
}

double hypotenuse (a, b) {
  double c = sqrt(pow(a, 2) + pow(b, 2));
  return double.parse(c.toStringAsFixed(2));
}

void main () {
  print(circleStats(3));
  print(circleStats(5));

  print(hypotenuse(3,4));
  print(hypotenuse(9,14));
}