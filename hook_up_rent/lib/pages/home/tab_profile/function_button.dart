import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_profile/function_button_data.dart';

import 'function_button_widget.dart';

class FunctionButton extends StatelessWidget {

  const FunctionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: dataList.map((item) => FunctionButtonWidget(item)).toList(),
    );
  }

}
