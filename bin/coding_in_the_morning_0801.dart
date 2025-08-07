// LeetCode Problem: https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/
// Problem: Given a sorted array nums, remove the duplicates in-place such that duplicates appeared at most twice and return the new length.
// Do not allocate extra space for another array, you must do this by modifying the input array
// in-place with O(1) extra memory.
// Example: Given nums = [1,1,1,2,2,3],
// Your function should return length = 5, with the first five elements of nums being modified

// 0번째랑 2번째 숫자가 같으면 거기에 다음 숫자를 덮어씌워줬음

class Solution {
  int removeDuplicates(List<int> nums) {
    // 이거 추가해줌! 오류나서
    if (nums.length <= 2) {
      return nums.length;
    }
    int detector = 0;
    for (int idx = 0; idx < nums.length; idx++) {
      if (detector < 2 || (detector >= 2 && nums[idx] != nums[detector - 2])) {
        nums[detector] = nums[idx];
        detector++;
      }
    }
    return detector;
  }
}
