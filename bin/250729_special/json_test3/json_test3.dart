// 회사명: 훈훈하니컴퍼니코리아
// 직원 수 : 150명
// 주소: 서울시 강남구 테헤란로 123 (06234)
// 부서: 대표팀, 개발팀, 디자인팀, 마케팅팀, 영업팀

import 'dart:convert';
import 'dart:io';

main() {
  File file = File('bin/250729_special/json_test3/test3.json');
  String jsonString = file.readAsStringSync();

  Company company = Company.fromJson(jsonDecode(jsonString));

  print(
    "회사명: ${company.name}\n"
    "직원 수: ${company.employeeCount}명\n"
    "주소: ${company.address.city}, ${company.address.street} (${company.address.zipCode})\n"
    "부서: ${company.departments.join(', ')}",
  );
}

class Company {
  String name;
  int employeeCount;
  Address address;
  List<String> departments;

  Company(this.name, this.employeeCount, this.address, this.departments);

  factory Company.fromJson(Map<String, dynamic> json) {
    List<String> departments = List<String>.from(json['departments']);
    Address address = Address.fromJson(json['address']);

    return Company(json['name'], json['employeeCount'], address, departments);
  }
}

class Address {
  String street;
  String city;
  String zipCode;

  Address(this.street, this.city, this.zipCode);

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(json['street'], json['city'], json['zipCode']);
  }
}
