/// LeetCode 136. Single Number
/// https://leetcode.com/problems/single-number/
/// 문제: 주어진 정수 배열에서 각 숫자는 두 번씩 나타나고,
/// 단 하나의 숫자만 한 번 나타납니다. 이 숫자를 찾아 반환해야 합니다.
/// 예시:
/// 입력: [4, 1, 2, 1, 2]
/// 출력: 4

//  * 소린 첫 시도 (--> 성공)
//  정렬 후, 짝수 인덱스의 숫자와 다음 숫자 비교
//  만약 다음 숫자가 없거나 다르면 그 숫자를 반환

class Solution {
  int singleNumber(List<int> nums) {
    nums.sort();
    // 새로 배운 점:
    // sort()는 void이므로, 정렬된 배열을 반환하지 않음
    // 따라서, 따로 변수에 넣어주지 않고 nums.sort()를 사용하여 nums 배열을 정렬해주면 됨.

    for (int i = 0; i < nums.length; i += 2) {
      if (i == nums.length - 1 || nums[i] != nums[i + 1]) {
        return nums[i];
      }
    }
    return 0;
  }
}

void main() {
  Solution solution = Solution();
  int result = solution.singleNumber([4, 1, 2, 1, 2]);
  print(result); // 4
}
