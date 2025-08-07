import 'dart:math';

// leetcode 11. Container With Most Water
// https://leetcode.com/problems/container-with-most-water/
// Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai).
// n vertical lines are drawn such that the two endpoints of line i is at (i, 0) and (i, ai).
// Find two lines, which together with the x-axis forms a container, such that the container contains the most water.
// Note: You may not slant the container.
// Example: Given [1,8,6,2,5,4,8,3,7], return 49.
// Explanation: The max area of water that can be contained

void main() {
  List<int> height = [1, 8, 6, 2, 5, 4, 8, 3, 7];

  // while문 써서
  int maxArea(List<int> height) {
    int ind1 = 0;
    int ind2 = height.length - 1;
    int maxArea = 0;

    while (ind1 < ind2) {
      int width = ind2 - ind1;
      int containerHeight = min(height[ind1], height[ind2]);
      if (maxArea < width * containerHeight) {
        maxArea = width * containerHeight;
      }

      if (height[ind1] < height[ind2]) {
        ind1++;
      } else {
        ind2--;
      }
    }
    return maxArea;
  }

  // for문 써서
  int maxArea2(List<int> height) {
    int maxArea = 0;

    for (int ind1 = 0, ind2 = height.length - 1; ind1 < ind2;) {
      int width = ind2 - ind1;
      int containerHeight = min(height[ind1], height[ind2]);
      if (maxArea < width * containerHeight) {
        maxArea = width * containerHeight;
      }

      if (height[ind1] < height[ind2]) {
        ind1++;
      } else {
        ind2--;
      }
    }
    return maxArea;
  }
}
