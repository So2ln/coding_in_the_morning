/// LeetCode 283. Move Zeroes
/// https://leetcode.com/problems/move-zeroes/
/// /// 문제: 주어진 정수 배열에서 모든 0을 배열의 끝으로 이동시키고, 나머지 숫자는 원래 순서를 유지해야 합니다.
/// /// 예시:
/// /// 입력: [0, 1, 0, 3, 12]
/// /// 출력: [1, 3, 12, 0, 0]

/// * 소린 첫 시도 (--> 성공)
class Solution1 {
  void moveZeroes(List<int> nums) {
    int idx = 0;

    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == 0) {
        idx += 1;
        nums.removeAt(i);
      }
    }

    for (int j = 0; j < idx; j++) {
      nums.add(0);
      // nums.insert(nums.length, 0);
    }
  }
}

void main() {
  Solution1 solution = Solution1();
  solution.moveZeroes([0, 1, 0, 3, 12]);
  print(solution); // [1, 3, 12, 0, 0]
}
