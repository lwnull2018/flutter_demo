import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '找小姐姐',
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('找小姐姐要电话')),
      body: Center(
        child: RouteButton(),
      ),
    );
  }

}

class RouteButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: (){ _navigateToXiaoJieJie(context); },
        child: const Text('去找小姐姐'),
    );
  }

  _navigateToXiaoJieJie(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=>const XiaoJieJie())
    );

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$result')));
  }

}

class XiaoJieJie extends StatelessWidget {
  const XiaoJieJie({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('小姐姐列表')),
      body: Center(
        child: Column(
          children: [
            OutlinedButton(onPressed: (){
                Navigator.of(context).pop('大长腿小姐姐：135666988666');
              }, child: const Text('大长腿小姐姐')
            ),
            OutlinedButton(onPressed: (){
                Navigator.of(context).pop('小蛮腰小姐姐：135666988888');
              }, child: const Text('小蛮腰小姐姐')
            ),
          ],
        ),
      )
    );
  }
}


