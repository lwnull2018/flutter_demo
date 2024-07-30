main() {
  print('hello world dart');

  var str = '你好dart';
  int num = 12334;

  String s = '字符串';

  print(str);
  print(num);
  print(s);

  print('-------const final ---------');
  const a = 123;//const 必须定义时就赋值
  print(a);

  final b;//fina 可以开始不赋值，只能赋值一次
  b = 1233;
  // b = 123333;//
  print(b);

  String str1 = "你好";
  String str2 = "Dart";

  print("$str1 $str2");

  bool flag = true;
  if(flag) {
    print('真');
  } else {
    print('假');
  }

  //List
  var a1 = ['zhangsa', 20, true];
  print(a1);
  print(a1.length);
  print(a1[1]);

  //List 指定类型
  var a2 = <String>['zhangsan', '李四'];
  print(a2);

  //List 定义空数组，容量是可变的，可通过add方法增加数据
  var a3 = [];
  a3.add('value');
  a3.add(10);
  print(a3);

  var a4 = List.filled(4, '12');//创建一个固定长度、内容的集合
  a4[2] = '2000';
  // a4.add('123');//固定长度的，不能添加数据
  print(a4);

  //定义Maps的方式
  var person = {
    "name": "张三",
    "age": 20,
    "work": ["快递员", '司机']
  };

  print(person);
  print(person["name"]);
  print(person["work"]);

  //第二种方式
  var p = new Map();
  p['name'] = '李四';
  p['age'] = 30;
  print(p);


  // is 判断数据类型
  var ss = true;
  if(ss is String) {
    print('ss is String');
  } else if(ss is int) {
    print('int');
  } else {
    print('其他类型');
  }

  print('------运算符------');
  //运算符
  var i1 = 13;
  var i2 = 5;

  print(i1 + i2);// 加
  print(i1 - i2);// 减
  print(i1 * i2);//乘
  print(i1 / i2);// 除 不会取整
  print(i1 % i2);//%

  var c;
  c ??= 20;
  print(c);

  print('------list------');
  List list = <String>['111', '222', '333'];
  list.forEach((element) => print(element));

  //自执行方法
  ((param){
    print('这个是自执行方法...param: $param');
  })(123);

  //递归 - 阶乘
  int sum = 1;

  fn(int n) {
    sum*=n;
    if(n==1) {
      return;
    }
    fn(n -1);
  }

  fn(5);

  print('fn(3) = $sum');

  int sum2 = 0;
  //递归，求和：1～100的求和
  fnSum(int n) {
    sum2+=n;

    if(n==0)return;

    fnSum(n - 1);

  }
  fnSum(100);

  print('fnSum(100) = $sum2');

  DateTime dateTime = new DateTime.now();
  print('dateTime = $dateTime');

}

class Person {

  String name;
  int age;

  //默认构造函数
  Person(this.name, this.age);

  Person.now(String name, int age) {
    this.name = name;
    this.age = age;
    print('我是命名构造函数');
  }

}