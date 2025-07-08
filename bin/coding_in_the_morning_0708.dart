/// LeetCode 1137. N-th Tribonacci Number
/// https://leetcode.com/problems/n-th-tribonacci-number/
/// 문제: 트리보나치 수열의 n번째 숫자를 반환해야 합니다.
/// 트리보나치 수열은 다음과 같이 정의됩니다:
/// T(0) = 0, T(1) = 1, T(2) = 1, T(n) = T(n-1) + T(n-2) + T(n-3) (n >= 3)
/// 예시:
/// 입력: n = 4
/// 출력: 4

// * 소린 1차 시도 (--> 실패)
// n=1일때 실패함
class Solution1 {
  int tribonacci(int n) {
    int t0 = 0;
    int t1 = 1;
    int t2 = 1;
    int tn = 0; // 초기값 설정
    List<int> tribonacci = [t0, t1, t2];
    for (int i = 3; i <= n; i++) {
      tn = t0 + t1 + t2;
      tribonacci.add(tn);
      t0 = t1;
      t1 = t2;
      t2 = tn;
    }
    print(tribonacci);
    print(tn);
  }
}

// * 소린 2차 시도 (--> 성공)
class Solution2 {
  int tribonacci(int n) {
    int t0 = 0;
    int t1 = 1;
    int t2 = 1;
    int tn = 0;
    List<int> allList = [t0, t1, t2];
    if (n < 3) {
      return allList[n];
    } else {
      for (int i = 3; i <= n; i++) {
        tn = t0 + t1 + t2;
        allList.add(tn);
        t0 = t1;
        t1 = t2;
        t2 = tn;
      }
      return tn;
    }
  }
}

void main() {
  Solution1 solution1 = Solution1();
  int result1 = solution1.tribonacci(4);
  print(result1); // 4

  Solution2 solution2 = Solution2();
  int result2 = solution2.tribonacci(25);
  print(result2); // 1389537
}
