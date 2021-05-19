main() {

  // dart整除
  int a = 8;
  int b = 5;
// a/b得到的是浮点型 a~/b才是整除
  print('a/b=${a/b}\na~/b=${a~/b}');

  dart_string();
}

//字符串操作
void dart_string() {
  //字符串输出
  String student1 = "zhang san";
  print("student1 = ${student1}");

  String student2 = "list";
  print("student2 = ${student2}");

  String addString = student1 + "和" + student2;
  print("addstring = ${addString}");

  //大小写
  String upper = addString.toUpperCase();
  String lower = addString.toLowerCase();
  print("upper ${upper} - lower ${lower}");

  //类型转换
  String count = "10";
  int countInt = int.parse(count);
  print("类型转换=${countInt}");

  //转字符串
  String count_to_string = countInt.toString();

  //小数精度保留 <=5舍 >5入
  print("小数精度 = ${3.33350.toStringAsFixed(3)}");
  print("小数精度 = ${3.33351.toStringAsFixed(3)}");

  //字符串分割
  String splitstring = "1,2,3,4,5";

  List spliteResult = splitstring.split(",");
  List<String> spliteResult2 = splitstring.split(",");
  print("${spliteResult}\n${spliteResult2}");

  String splitMapJoin = splitstring.splitMapJoin(",", onMatch: (Match match) {
    return "x";//替换条件中的字符串
  }, onNonMatch: (String onNonMatch) {
    return "a";//替换非条件中的字符串
  });
  //splitMapJoin = axaxaxaxa
  print("splitMapJoin = ${splitMapJoin}");

  //字符串 开头 尾部 匹配
  String headfooter = "headbodyfooter";
  bool startsWith = headfooter.startsWith("head");
  bool endsWith = headfooter.endsWith("footer");
  bool contains = headfooter.contains("body");
  //从索引开始匹配字符，后面只要含有搜索字符则为true
  bool containsWithIndex = headfooter.contains("body", 1);

  //字符串替换
  headfooter.replaceAll("o", "xx");

}