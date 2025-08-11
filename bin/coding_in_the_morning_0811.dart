void main() {
  String s = 'hello';

  String vowels = 'aeiouAEIOU';
  List<String> vowelList = [];

  for (int v = 0; v < s.length; v++) {
    if (vowels.contains(s[v])) {
      vowelList.add(s[v]);
    }
  }
  vowelList = vowelList.reversed.toList();
  List<String> sList = s.split('');

  int vidx = 0;
  for (int i = 0; i < sList.length; i++) {
    if (vowels.contains(sList[i])) {
      sList[i] = vowelList[vidx];
      vidx++;
    }
  }
  s = sList.join('');
  print(s); 
}
