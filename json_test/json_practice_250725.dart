import 'dart:convert';
import 'dart:io';

// json_practice_250725.dart
void main() {
  // first json practice
  String jsonF = '''{
    "name": "김철수",
    "email": "kimcs@google.com",
    "age": 25,
    "skills": ["Flutter", "Dart", "Firebase"]
}''';

  readString(jsonF);

  // second json practice
  // json file reading
  // json_test/json_blog.json
  readFile('json_test/json_blog.json');
}

// ------ first json practice ------
void readString(String jsonF) {
  Map<String, dynamic> individual = jsonDecode(jsonF);
  print(
    '나는 ${individual['name']}이고, 나이는 ${individual['age']}살입니다. 연락할 일이 있으면 ${individual['email']}로 연락주세요. \n참고로 ${individual['skills'].join(', ')}를 할 수 있습니다.', // ${individual['skills'].join(', ')}
  );
}

// ------ second json practice ------
void readFile(String jsonFilePath) {
  File file = File(jsonFilePath);
  String blogInfo = file.readAsStringSync();

  Map<String, dynamic> blogHost = jsonDecode(blogInfo);

  String name = blogHost['user']['name'];
  String bio = blogHost['user']['profile']['bio'];
  List<dynamic> posts = blogHost['posts'];

  int likes = 0;
  for (var eachPost in posts) {
    int likeCount = eachPost['likes'];
    likes += likeCount;
  }

  print('''나는 $name이고, $bio. \n
    내가 쓴 글은 ${posts.length}개입니다. \n
    총 좋아요는 $likes개입니다. \n
     ''');
}
