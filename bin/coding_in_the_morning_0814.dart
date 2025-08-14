// leetcode 383. Ransom Note
// https://leetcode.com/problems/ransom-note/
// 문제: 주어진 ransomeNote를 magazine에서 만들 수 있는지 확인하는 문제
// ransomeNote의 각 글자는 magazine에서 하나씩만 사용할 수 있음
// 예시: ransomeNote = "aa", magazine = "aab" -> true

void main() {
  String ransomeNote = "aaabbbccc";
  String magazine = "abcabcabc";
  String rangazine = "";

  for (int i = 0; i < ransomeNote.length; i++) {
    if (magazine.contains(ransomeNote[i])) {
      int idx = magazine.indexOf(ransomeNote[i]);
      rangazine += magazine[idx];
      magazine = magazine.substring(0, idx) + magazine.substring(idx + 1);
    } else {
      print("false");
      return;
    }
  }
  if (ransomeNote.length == rangazine.length) {
    if (ransomeNote == rangazine) {
      print("true");
      return;
    }
  }
}

// 리트코드 성공!
// 45ms 소요
class Solution {
  bool canConstruct(String ransomNote, String magazine) {
    String rangazine = "";

    for (int i = 0; i < ransomNote.length; i++) {
      if (magazine.contains(ransomNote[i])) {
        int idx = magazine.indexOf(ransomNote[i]);

        rangazine += magazine[idx];

        magazine = magazine.substring(0, idx) + magazine.substring(idx + 1);
      } else {
        return false;
      }
    }
    if (ransomNote.length == rangazine.length) {
      if (ransomNote == rangazine) {
        return true;
      }
    }
    return false;
  }
}
