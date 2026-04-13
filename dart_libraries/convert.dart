import 'dart:convert';

void main () {
  Map studentMap = <String, dynamic>{
    "name": "Sam",
    "age": 25,
    "grades": [93.4, 88.6, 99.5],
    "passed": true
  };

  var jsonStudentMap = jsonEncode(studentMap);
  var decodedStudentMap = jsonDecode(jsonStudentMap);
  double averageGrade = 0;
  decodedStudentMap["grades"].forEach((grade) {
    averageGrade += grade;
  });
  averageGrade /= decodedStudentMap["grades"].length;
  print(averageGrade.toStringAsFixed(2));
}