import 'dart:convert';

void main() {
  var point = Point(2, 12, 'Some point');
  var pointJson = json.encode(point);
  print('pointJson=$pointJson');

  //List Map
  var points = [point, point];
  var pointsJson = json.encode(points);
  print('pointsJson=$pointsJson');
  print(' ');

  var decoded = json.decode(pointJson);
  print('decoded.runtimeType=${decoded.runtimeType}');
  var point2 = Point.fromJson(decoded);
  print('point2=$point2');

  decoded = json.decode(pointsJson);
  print('decode.runtimeType=${decoded.runtimeType}');
  var points2 = <Point>[];
  for (var map in decoded) {
    points2.add(Point.fromJson(map));
  }
  print('points=$points2');
}

class Point {
  int x;
  int y;
  String description;

  Point(this.x, this.y, this.description);

  Map<String, dynamic> toJson() => {'x': x, 'y': y, 'desc': description};

  Point.fromJson(Map<String, dynamic> map)
      : x = map['x'],
        y = map['y'],
        description = map['desc'];

  @override
  String toString() {
    // TODO: implement toString
    return 'Point{x=$x,y=$y,desc=$description}';
  }
}
