/// LeetCode 26. Remove Duplicates from Sorted Array
/// https://leetcode.com/problems/remove-duplicates-from-sorted-array/
/// 늦잠자서 지각함,,

void main() {
  var nums = [1, 1, 2];

  for (int i = 0; i < nums.length; i++) {
    for (int j = i + 1; j < nums.length; j++) {
      if (nums[i] == nums[j]) {
        nums.removeAt(j);
        j--; // Adjust index after removal
      }
    }
  }
}
