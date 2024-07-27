import 'package:flutter/material.dart';
import 'package:health_goody/core/presentation/utils/theme.dart';

class TextFormFieldWid extends StatefulWidget {
  final TextEditingController controller;
  final bool? isSufix;
  final String hintText;
  const TextFormFieldWid({
    super.key,
    required this.controller,
    required this.hintText,
    this.isSufix,
  });

  @override
  State<TextFormFieldWid> createState() => _TextFormFieldWidState();
}

class _TextFormFieldWidState extends State<TextFormFieldWid> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      obscureText: widget.isSufix == true ? _obscureText : false,
      style: Theme.of(context).textTheme.labelSmall,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintStyle: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(color: appColors.disableBgColor),
        hintText: widget.hintText,
        suffixIcon: widget.isSufix == true
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
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
