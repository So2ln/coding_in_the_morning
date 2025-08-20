import 'dart:math';

void main() {
  List<int> gain = [-5, 1, 5, 0, -7];

  List<int> accum = [0];

  for (int i = 0; i < gain.length; i++) {
    if (i == 0) {
      accum.add(gain[i]);
    } else {
      accum.add(accum[i] + gain[i]);
    }
  }
  print(accum.reduce(max));
  // return(accum.reduce(max));
}
