import 'package:flutter/material.dart';
import 'package:health_goody/core/presentation/utils/theme.dart';

class TextFormFieldWid extends StatelessWidget {
  final TextEditingController controller;
  final bool? isSufix;
  final String hintText;
  const TextFormFieldWid(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isSufix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      obscureText: true,
      style: Theme.of(context).textTheme.labelSmall,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintStyle: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(color: appColors.disableBgColor),
        hintText: hintText,
        suffixIcon: isSufix == true
            ? const Icon(Icons.visibility_off_outlined)
            : const SizedBox.shrink(),
        filled: true,
        fillColor: appColors.inputBgFill,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
