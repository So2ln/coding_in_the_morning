// leetcode 205. Isomorphic Strings
// https://leetcode.com/problems/isomorphic-strings/
// 문제: 두 문자열 s와 t가 이성동형(isomorphic)인지 확인하는 문제
// 이성동형이란, s의 각 글자가 t의 각 글자로 일대일 대응되는 경우를 말함
// 예시: s = "egg", t = "add" -> true
// s = "foo", t = "bar" -> false
// s = "paper", t = "title" -> true

void main() {
  String s = "egg";
  String t = "add";
  String newT = "";

  Map<String, String> map = {};
  for (int i = 0; i < s.length; i++) {
    if (!map.containsKey(s[i]) && !map.containsValue(t[i])) {
      // 새로운 글자 매핑
      map[s[i]] = t[i];
      newT += t[i];
      print(map);
    } else if (map.containsKey(s[i]) && map[s[i]] == t[i]) {
      // 이미 매핑된 경우
      newT += map[s[i]]!;
      // print('map[s[i]]: ${map[s[i]]}');
      // print('t[i]: ${t[i]}');
      // print('newT: $newT');
      continue;
    }
    // else if (map.containsKey(s[i]) && map[s[i]] != t[i]) {
    //   // 다른 글자에 매핑된 경우
    //   break;
    // }
  }

  if (newT.length == s.length) {
    if (newT == t) {
      print("true");
      return;
    }
  }
  print('false');
  return;

  //////
  ///
  ///
  ///
}

// 125ms
class Solution1 {
  bool isIsomorphic(String s, String t) {
    String newT = "";

    Map<String, String> map = {};
    for (int i = 0; i < s.length; i++) {
      if (map.containsKey(s[i]) && map[s[i]] != t[i]) {
        // 매핑된 글자가 다르다면
        break;
      } else if (map.containsKey(s[i]) && map[s[i]] == t[i]) {
        // 이미 매핑되었다면
        newT += map[s[i]]!;
      } else if (!map.containsKey(s[i]) && !map.containsValue(t[i])) {
        // 새로운 글자 매핑
        map[s[i]] = t[i];
        newT += t[i];
      }
    }

    if (newT.length == s.length) {
      if (newT == t) {
        return true;
      }
    }

    return false;
  }
}

//116ms
class Solution2 {
  bool isIsomorphic(String s, String t) {
    String newT = "";

    Map<String, String> map = {};
    for (int i = 0; i < s.length; i++) {
      if (!map.containsKey(s[i]) && !map.containsValue(t[i])) {
        // 새로운 글자 매핑
        map[s[i]] = t[i];
        newT += t[i];
        print(map);
      } else if (map.containsKey(s[i]) && map[s[i]] == t[i]) {
        // 이미 매핑된 경우
        newT += map[s[i]]!;

        continue;
      }
    }

    if (newT.length == s.length) {
      if (newT == t) {
        return true;
      }
    }

    return false;
  }
}

// 7ms
class Solution3 {
  bool isIsomorphic(String s, String t) {
    for (int i = 0; i < s.length; i++) {
      // s에서 현재 문자가 처음 등장한 인덱스와
      // t에서 현재 문자가 처음 등장한 인덱스가 다르면 패턴이 깨진 것
      if (s.indexOf(s[i]) != t.indexOf(t[i])) {
        return false;
      }
    }
    return true;
  }
}
