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

PreferredSize appbar(BuildContext context, String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(55.h),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SafeArea(
        child: ListTile(
          leading: CircleAvatar(
            radius: 20.h,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 19.h,
              child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_outlined)),
            ),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    ),
  );
}
