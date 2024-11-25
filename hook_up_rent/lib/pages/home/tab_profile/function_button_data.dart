import 'package:flutter/material.dart';
import 'package:hook_up_rent/scope_model/auth.dart';
import 'package:hook_up_rent/utils/scoped_model_helper.dart';

class FunctionButtonItem {
  final String imageUrl;
  final String title;
  final Function? onTapHandler;

  FunctionButtonItem(this.imageUrl, this.title, this.onTapHandler);
}

final List<FunctionButtonItem> dataList = [
  FunctionButtonItem('static/images/home_profile_record.png', '看房记录', (){}),
  FunctionButtonItem('static/images/home_profile_order.png', '我的订单', (){}),
  FunctionButtonItem('static/images/home_profile_favor.png', '我的收藏', (){}),
  FunctionButtonItem('static/images/home_profile_id.png', '身份认证', (){}),
  FunctionButtonItem('static/images/home_profile_message.png', '联系我们', (){}),
  FunctionButtonItem('static/images/home_profile_contract.png', '电子合同', (){}),
  FunctionButtonItem('static/images/home_profile_house.png', '房屋管理', (context) {
    bool isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;
    if (isLogin) {
      Navigator.pushNamed(context, '/roomManage');
      return;
    }
    Navigator.pushNamed(context, '/login');
  }),
  FunctionButtonItem('static/images/home_profile_wallet.png', '钱包', (){}),
];