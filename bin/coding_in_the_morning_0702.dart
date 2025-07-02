/// 2025.07.02 - 3rd coding in the morning
import 'dart:io';

void main() {
  stdout.write('Please enter a sentence\n : ');
  String? sentence = stdin.readLineSync();
  print('Input: s = "$sentence"');

  List<String> words = [];
  if (sentence != null && sentence.isNotEmpty) {
    // print(sentence.runtimeType);
    words = sentence.split(' ');
  }

  String lastword = words.last;
  int len = lastword.length;
  print('Output: $lastword');
  print('Explanation: The last word is "$lastword" with length $len');
}

class Solution {
  int lengthOfLastWord(String s) {
    List<String> words = [];
    words = s.split(' ');
    String lastword = words.last;
    return lastword.length;
  }
}
