void main() {
  print('right triangle\n');

  for (var i = 1; i <= 5; i++) {
    print('*' * i);
  }

  print('\nright reverse triangle\n');

  for (var i = 5; i >= 1; i--) {
    print('*' * i);
  }

  print('\nsquare\n');

  var side = 5;
  for (var i = 0; i < side; i++) {
    print('*' * side);
  }
}
