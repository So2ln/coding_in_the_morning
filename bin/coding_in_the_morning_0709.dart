// * 소린 첫 시도 (--> 실패; nums=[1]일 경우 1을 반환해야 하는데 0을 반환함)
class Solution1 {
  int majorityElement(List<int> nums) {
    Map<int, List<int>> idxMap = {};

    for (int i = 0; i < nums.length; i++) {
      if (idxMap.containsKey(nums[i])) {
        idxMap[nums[i]]?.add(i);
      } else {
        idxMap[nums[i]] = [];
      }
    }

    int resultKey = 0;
    int maxCount = 0;

    for (var entry in idxMap.entries) {
      int key = entry.key;
      List<int> value = entry.value;

      if (value.length > maxCount) {
        maxCount = value.length;
        resultKey = key;
      }
    }

    return resultKey;
  }
}

// * 소린 두번째 시도
class Solution2 {
  int majorityElement(List<int> nums) {
    Map<int, List<int>> idxMap = {};

    for (int i = 0; i < nums.length; i++) {
      idxMap.putIfAbsent(nums[i], () => []).add(i);
      // 오! putIfAbsent를 사용하면
      // 키(요소)가 존재하지 않을때만 새로운 리스트를 생성하여 추가
      // 키가 이미 존재하면 기존 리스트에 현재 인덱스 추가
    }

    int resultKey = 0;
    int maxCount = 0;

    for (var entry in idxMap.entries) {
      int key = entry.key;
      List<int> value = entry.value;

      if (value.length > maxCount) {
        maxCount = value.length;
        resultKey = key;
      }
    }

    return resultKey;
  }
}

void main() {
  var nums1 = [3, 2, 3];
  var nums2 = [2, 2, 1, 1, 1, 2, 2];

  Solution1 solution = Solution1();
  int result1 = solution.majorityElement(nums1);
  print(result1); // 3

  int result2 = solution.majorityElement(nums2);
  print(result2); // 2
}
