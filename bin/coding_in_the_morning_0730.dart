class Solution {
  void rotate(List<int> nums, int k) {
    var ln = nums.length;
    var rotIndex = ln - k - 1;
    List<int> temp = nums.sublist(ln - k, ln);
  }
}

main() {
  Solution sol = Solution();
  List<int> nums = [1, 2, 3, 4, 5, 6, 7];
  int k = 3;
  sol.rotate(nums, k);
  print(nums); // Output: [5, 6, 7, 1, 2, 3, 4]
}
