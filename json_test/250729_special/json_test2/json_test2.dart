// 책 제목: flutter 완벽 가이드
// 가격: 35,000원
// 저자: 류지훈, 홍길동... / 총 X 명
// 페이지: 520페이지

// import 'dart:convert';
// import 'dart:io';

// void main() {
//   readFile('bin/250729_special/json_test2/test2.json');
// }

// void readFile(String jsonFilePath) {
//   File file = File(jsonFilePath);
//   String jsonString = file.readAsStringSync();
//   Map<String, dynamic> bookInfo = jsonDecode(jsonString);

//   String title = bookInfo['title'];
//   int price = bookInfo['price'];
//   List<String> authors = List<String>.from(bookInfo['authors']);
//   int pages = bookInfo['pages'];

//   print(
//     '책 제목: $title\n가격: $price원\n저자: ${authors.join(", ")} / 총 ${authors.length}명\n페이지: $pages페이지',
//   );
// }
//--> fromJson이랑 Book 클래스 만들어서 하는거 실패했고,
// 금액도 35,000 포맷 못맞춤

// 튜터님 코드

import 'dart:convert';
import 'dart:io';

main() {
  File file = File('test/test2.json');
  String jsonString = file.readAsStringSync();

  Book book = Book.fromJson(jsonDecode(jsonString));

  print(
    "책 제목: ${book.title}\n"
    "가격: ${book.formattedPrice}원\n"
    "저자: ${book.authors.join(', ')} / 총 ${book.authors.length}명\n"
    "페이지: ${book.pages}페이지",
  );
}

class Book {
  String title;
  int price;
  List<String> authors;
  int pages;

  Book(this.title, this.price, this.authors, this.pages);

  String get formattedPrice {
    return price.toString().replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
  }

  factory Book.fromJson(Map<String, dynamic> json) {
    List<String> authors = List<String>.from(json['authors']);

    return Book(json['title'], json['price'], authors, json['pages']);
  }
}
