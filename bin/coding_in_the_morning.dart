void main() {
  /// 2025.06.30 - 1st coding in the morning
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

  /// 2025.07.01 - 2nd coding in the morning

  print('pyramid\n');

  for (var row = 4; row >= 0; row--) {
    var space = ' ' * (row);
    var stars = '*' * ((4 - row) * 2 + 1);

    print('$space $stars');
  }

  print('list in list\n');

  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];

  matrixSquare(matrix);
}

matrixSquare(List<List<int>> matrix) {
  var left = 0;
  var right = 0;

  for (var row = 0; row < matrix.length; row++) {
    left += matrix[row][row];
    right += matrix[row][(matrix.length - 1) - row];
  }

  print('Sum of the primary diagonal: $left'); // 왼쪽 대각선 합: 15
  print('Sum of the anti-diagonal: $right'); // 오른쪽 대각선 합: 15
}
