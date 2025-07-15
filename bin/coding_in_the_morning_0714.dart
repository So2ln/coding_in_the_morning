// leetcode 88

// *소린 1차 시도 (--> 실패)

class Solution1 {
  void merge(List<int> nums1, int m, List<int> nums2, int n) {
    if (nums1.length > 0) {
      nums1.removeWhere((x) => x == 0);
    }
    ;

    nums1.addAll(nums2);
    nums1.sort();
  }
}

// nums1 중간에 있는 0을 없애면 안됨 (문제 이해를 잘못함)

// * 소린 2차 시도 (--> 성공)
class Solution2 {
  void merge(List<int> nums1, int m, List<int> nums2, int n) {
    if (nums1.length > 0) {
      int keepCount = nums2.length;

      // nums1에서 0 인덱스 추출
      List<int> indices = [];
      for (int i = 0; i < nums1.length; i++) {
        if (nums1[i] == 0) {
          indices.add(i);
        }
      }

      //뒤에서 keepCount개 남기고 지워
      List<int> toRemoveIdx = indices.sublist(indices.length - keepCount);

      // removeAt은 역순으로
      toRemoveIdx.sort((b, a) => a.compareTo(b));
      for (int idx in toRemoveIdx) {
        nums1.removeAt(idx);
      }
    }
    ;

    nums1.addAll(nums2);
    nums1.sort();
  }
}
