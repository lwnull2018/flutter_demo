import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_profile/function_button_data.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

class FunctionButtonWidget extends StatelessWidget {
  
  final FunctionButtonItem data;
  
  const FunctionButtonWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(null != data.onTapHandler && data.onTapHandler is Function) {
          data.onTapHandler!(context);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width * 0.33,
        height: 90.0,
        // color: Colors.blue,
        child: Column(
          children: [
            CommonImage(src: data.imageUrl),
            Text(data.title)
          ],
        ),
      ),
    );
  }
  
}
