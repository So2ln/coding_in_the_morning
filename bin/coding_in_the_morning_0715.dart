// leetcode 121
// 실패
import 'dart:math';

void main() {
  List<int> prices = [7, 1, 5, 3, 6, 4];

  int allIdx = prices.length;
  int buyVal = prices.sublist(0, (allIdx - 2)).reduce(min);
  int buyIdx = prices.indexOf(buyVal);
  int sellVal = prices.sublist(buyIdx).reduce(max);

  int sellIdx = prices.lastIndexOf(sellVal);

  int maxProfit = 0;

  if ((sellVal - buyVal) > 0) {
    if (buyIdx < sellIdx) {
      maxProfit = sellVal - buyVal;
    } else {
      List<int> sellDays = prices.sublist(buyIdx)..sort();
      for (int p = sellDays.length - 1; p == 0; p--) {
        sellVal = sellDays[p];
        sellIdx = prices.lastIndexOf(sellVal);
        if (buyIdx < sellIdx) {
          maxProfit = sellVal - buyVal;
        }
      }
    }
  }

  print(maxProfit);
}
