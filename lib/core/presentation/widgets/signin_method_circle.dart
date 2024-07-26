import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignInCircleWid extends StatelessWidget {
  final String imagePath;
  const SignInCircleWid({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 26.h,
      backgroundColor: Colors.grey,
      child: CircleAvatar(
          radius: 25.h,
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            imagePath,
            height: 30.h,
            width: 30.h,
          )),
    );
  }
}
