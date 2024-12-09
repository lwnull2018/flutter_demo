Future<void> main() async {
  print(await fetchUserData());
  print('result...');

  // for (var i = 0; i < 10; i++) {
  //   print('hello ${i + 1}');
  // }
}

Future<String> fetchUserData() async {

  return  Future.delayed(const Duration(seconds: 2), () => '步步高');

}
