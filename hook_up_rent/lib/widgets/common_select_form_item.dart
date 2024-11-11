import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_formt_item.dart';

import '../utils/common_picker/index.dart';

class CommonSelectFormItem extends StatelessWidget {
  final String label;
  final int value;
  final List<String> options;
  final Function(int) onChange;

  const CommonSelectFormItem(
      {super.key,
      required this.label,
      required this.value,
      required this.options,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label: label,
      contentBuilder: (context) {
        return GestureDetector(
          onTap: () {
            var result = CommonPicker.showPicker(context, options, value);
            result.then((selectedValue) {
              if (selectedValue != null &&
                  value != selectedValue) {
                onChange(selectedValue);
              }
            });
          },
          behavior: HitTestBehavior.translucent,
          child: Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  options[value],
                  style: const TextStyle(fontSize: 16.0),
                ),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
        );
      },
    );
  }
}