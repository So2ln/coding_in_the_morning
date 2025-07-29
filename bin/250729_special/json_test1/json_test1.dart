//출력예시: "이민수는 3학년 컴퓨터공학과 학생이며, 평점은 3.8입니다."
// name: "이민수"
// grade: 3
// subject: "컴퓨터공학과"
// gpa: 3.8

import 'dart:convert';
import 'dart:io';

// void main() {
//   readFile('bin/250729_special/json_test1/test1.json');
// }

// void readFile(String jsonFilePath) {
//   File file = File(jsonFilePath);

//   Map<String, dynamic> personInfo = jsonDecode(file.readAsStringSync());

//   String name = personInfo['name'];
//   int grade = personInfo['grade'];
//   String subject = personInfo['subject'];
//   double gpa = personInfo['gpa'];

//   print('$name은 $grade학년 $subject 학생이며, 평점은 $gpa입니다.');
// }

// 튜터님과 같이 진행

main() {
  File file = File('json_test1/test1.json');
  String jsonString = file.readAsStringSync();
  Map<String, dynamic> jsonMap = jsonDecode(jsonString);
  jsonMap['name'];

  // print(jsonString);

  Student student = Student.fromJson(jsonDecode(jsonString));
  print(
    '${student.name}은 ${student.grade}학년 ${student.subject} 학생이며, 평점은 ${student.gpa}입니다.',
  );
}

class Student {
  String name;
  int grade;
  String subject;
  double gpa;

  Student(this.name, this.grade, this.subject, this.gpa);

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(json['name'], json['grade'], json['subject'], json['gpa']);
  }

  @override
  String toString() {
    return '$name은 $grade학년 $subject 학생이며, 평점은 $gpa입니다.';
  }
}
