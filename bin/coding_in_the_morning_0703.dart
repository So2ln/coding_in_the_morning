// * 문제
// 두 개의 문자열 s와 t가 주어졌을 때,
// t가 s의 애너그램인지 확인하는 함수를 작성하세요.
// 애너그램은 두 문자열이 같은 문자를 같은 개수만큼 가지고 있지만, 순서는 다른 경우를 말합니다.

// * 조건
// 1. 1 <= s.length, t.length <= 5 * 10^4
// 2. s와 t는 영어 소문자로만 이루어져 있습니다.

// * 예시
// 1. 입력: s = "anagram", t = "nagaram" 출력: true
// 	설명: t는 s의 애너그램입니다.

// 2. 입력: s = "rat", t = "car" 출력: false
// 	설명: t는 s의 애너그램이 아닙니다.

// * 소린 첫 풀이 (--> failed, == 주소개념 없어서.. : List끼리 비교하면 false로 나옴)
class Solution1 {
  bool isAnagram(String s, String t) {
    List<String> sList = s.split('');
    List<String> tList = t.split('');

    if (sList.length != tList.length) {
      return false;
    }

    sList.sort();
    tList.sort();
    print(sList);
    print(tList);

    if (sList != tList) {
      return false;
    }

    return true;
  }
}

// * 소린 두 번째 풀이 (--> 성공)
class Solution2 {
  bool isAnagram(String s, String t) {
    List<String> sList = s.split('');
    List<String> tList = t.split('');

    if (sList.length != tList.length) {
      return false;
    }

    sList.sort();
    tList.sort();
    print(sList);
    print(tList);

    // * List끼리 비교할 때는 주소가 아니라 값으로 비교해야 함
    // 따라서, List를 join() 함수를 사용하여 문자열로 변환하여 비교
    if (sList.join() != tList.join()) {
      return false;
    }

    return true;
  }
}

/// 추가로 알게된 내용
/// cascade 연산자(..)를 사용하면 연속적으로 함수 사용 가능!!!
/// 예시:
/// 1. cascade 연산자를 사용하지 않을 때!!
/// var buffer = StringBuffer();
/// buffer.write('Hello');
/// buffer.write(' '); // 공백 추가
/// buffer.write('world');
///
///
/// 2. cascade 연산자를 사용할 때!!
///
/// 2-1. StringBuffer()자체에 write
/// var buffer = StringBuffer()
///    ..write('Hello')
///    ..write(' ')
///    ..write('world')
///
/// 2-2 buffer변수에 write
/// var buffer = StringBuffer()
///  buffer =
///    ..write('Hello')
///    ..write(' ')
///    ..write('world')

// * 소린 세번째 풀이 (--> 성공, cascade 연산자 사용 및 List join() 사용)
class Solution3 {
  bool isAnagram(String s, String t) {
    // cascade 연산자(..)를 사용하여 List를 정렬
    List<String> sList = s.split('')..sort();
    List<String> tList = t.split('')..sort();

    if (sList.length != tList.length) {
      return false;
    }

    print(sList);
    print(tList);

    // join() 함수 사용
    if (sList.join() != tList.join()) {
      return false;
    }
    return true;
  }
}

// * 소린 네번째 풀이 (--> 성공, Map 사용)
class Solution4 {
  bool isAnagram(String s, String t) {
    if (s.length != t.length) {
      return false;
    }

    Map<String, int> charCount = {};

    for (var char in s.split('')) {
      charCount[char] = (charCount[char] ?? 0) + 1;
    }

    for (var char in t.split('')) {
      if (!charCount.containsKey(char) || charCount[char] == 0) return false;
      charCount[char] = charCount[char]! - 1;
    }

    // for (int i = 0; i < s.length; i++) {
    //   charCount[s[i]] = (charCount[s[i]] ?? 0) + 1;
    //   charCount[t[i]] = (charCount[t[i]] ?? 0) - 1;
    // }
    //
    // for (int count in charCount.values) {
    //   if (count != 0) {
    //     return false;
    //   }
    // }

    return true;
  }
}

///////////////////////// * 테스트 코드 /////////////////////////////////////////
void main() {
  Solution4 solution = Solution4();

  // Test case 1
  String s1 = "anagram";
  String t1 = "nagaram";
  print(solution.isAnagram(s1, t1)); // Expected output: true

  // Test case 2
  String s2 = "rat";
  String t2 = "car";
  print(solution.isAnagram(s2, t2)); // Expected output: false
}
