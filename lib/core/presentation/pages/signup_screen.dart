import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:health_goody/core/presentation/utils/constants.dart';
import 'package:health_goody/core/presentation/utils/image_paths.dart';
import 'package:health_goody/core/presentation/utils/message_generator.dart';
import 'package:health_goody/core/presentation/utils/theme.dart';
import 'package:health_goody/core/presentation/widgets/animated_container.dart';
import 'package:health_goody/core/presentation/widgets/signin_method_circle.dart';
import 'package:health_goody/core/presentation/widgets/textformfield.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final ValueNotifier<bool> agreeCheck = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: maxScreenWidth,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(MessageGenerator.getMessage("auth-create-account"),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(height: 5.h),
                Text(
                  MessageGenerator.getMessage('auth-create-account-message'),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 28.h),
                Text(MessageGenerator.getLabel('name')),
                SizedBox(height: 5.h),
                TextFormFieldWid(
                    controller: nameController,
                    hintText: MessageGenerator.getMessage('user-enter-name')),
                Text(MessageGenerator.getLabel('email')),
                SizedBox(height: 5.h),
                TextFormFieldWid(
                    controller: emailController,
                    hintText: MessageGenerator.getLabel('user@domain.com')),
                Text(MessageGenerator.getLabel('mobile')),
                SizedBox(height: 5.h),
                TextFormFieldWid(
                    controller: mobileController,
                    hintText: MessageGenerator.getLabel('1234567890')),
                Text(MessageGenerator.getLabel('password')),
                SizedBox(height: 5.h),
                TextFormFieldWid(
                    isSufix: true,
                    controller: passwordController,
                    hintText: MessageGenerator.getLabel('user@123')),
                Row(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: agreeCheck,
                      builder: (context, value, child) {
                        return Checkbox(
                          value: value,
                          onChanged: (newValue) {
                            agreeCheck.value = newValue!;
                          },
                          fillColor: MaterialStatePropertyAll(
                            agreeCheck.value
                                ? appColors.primaryColor
                                : Colors.white,
                          ),
                        );
                      },
                    ),
                    Linkify(
                      onOpen: (link) async {
                        if (!await launchUrl(Uri.parse(link.url))) {}
                      },
                      text:
                          MessageGenerator.getMessage("auth-visit-site-guide"),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(),
                      linkStyle: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: appColors.linkTextColor),
                    ),
                  ],
                ),
                ValueListenableBuilder(
                  valueListenable: agreeCheck,
                  builder: (context, value, child) {
                    return AnimatedClickableTextContainer(
                      title: MessageGenerator.getLabel('Next'),
                      iconSrc: '',
                      bgColor: agreeCheck.value
                          ? appColors.pleasantButtonBg
                          : appColors.pleasantButtonBg.withOpacity(0.5),
                      press: () {
                        if (agreeCheck.value) {
                          context.push('/signupAuthImage');
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Divider(),
                      ),
                    ),
                    Text(
                      MessageGenerator.getMessage('auth-signin-methods'),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.grey),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Divider(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SignInCircleWid(imagePath: ImagePaths.facebookSvg),
                    SizedBox(width: 8.w),
                    const SignInCircleWid(imagePath: ImagePaths.googleSvg),
                  ],
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MessageGenerator.getMessage('auth-signin-no-account'),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(),
                    children: <TextSpan>[
                      TextSpan(
                          text: MessageGenerator.getMessage('auth-signin'),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: Colors.red),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go("/signin");
                            }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
