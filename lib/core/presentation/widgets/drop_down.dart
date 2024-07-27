import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_goody/core/presentation/utils/theme.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final ValueNotifier<String?> selectedValue;
  final int index;

  CustomDropdown(
      {Key? key,
      required this.hintText,
      required this.selectedValue,
      required this.index})
      : super(key: key);

  final List<List<String>> dropDownList = [
    ['Male', 'Female'],
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: selectedValue,
      builder: (context, value, child) {
        return Container(
          decoration: BoxDecoration(
            color: appColors.inputBgFill,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          height: 50.0.h,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: value,
              hint: Text(
                hintText,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              isExpanded: true,
              items: dropDownList[index].map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child:
                      Text(item, style: Theme.of(context).textTheme.labelSmall),
                );
              }).toList(),
              onChanged: (newValue) {
                selectedValue.value = newValue;
              },
            ),
          ),
        );
      },
    );
  }
}
