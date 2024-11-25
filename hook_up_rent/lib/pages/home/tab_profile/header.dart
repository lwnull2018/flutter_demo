import 'package:flutter/material.dart';
import 'package:hook_up_rent/utils/scoped_model_helper.dart';

import '../../../scope_model/auth.dart';

var headerTextStyle = const TextStyle(color: Colors.white, fontSize: 18.0);

class TabHeader extends StatelessWidget {

  const TabHeader({super.key});

  Widget _notLoginBuilder(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(color: Colors.green),
      child: Row(
        children: [
          Container(
            height: 65.0,
            width: 65.0,
            child: const CircleAvatar(
              backgroundImage: NetworkImage('https://pic.pngsucai.com/00/93/71/0bb288bbe60706bd.webp'),
            ),
          ),
          const SizedBox(width: 10.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed('/login');
                    },
                    child:  Text('登陆', style: headerTextStyle,),
                  ),
                  Text('/', style: headerTextStyle,),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed('/register');
                    },
                    child: Text('注册', style: headerTextStyle,),
                  ),
                ],
              ),
              const Text('登陆后可以体验更多', style: TextStyle(color: Colors.white),),
            ],
          )
        ],
      ),
    );
  }

  Widget _loginBuilder(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(color: Colors.green),
      child: Row(
        children: [
          Container(
            height: 65.0,
            width: 65.0,
            child: const CircleAvatar(
              backgroundImage: NetworkImage('https://gd-hbimg.huaban.com/cc80455c85bd2f7310ba80804ac48228fdc3a36c1080a-G7VV23_fw1200webp'),
            ),
          ),
          const SizedBox(width: 10.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed('/login');
                    },
                    child:  Text('已登陆用户名', style: headerTextStyle,),
                  ),
                ],
              ),
              const Text('查看编辑个人资料', style: TextStyle(color: Colors.white),),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;
    return isLogin ? _loginBuilder(context) : _notLoginBuilder(context);
  }

}
