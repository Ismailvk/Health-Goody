import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_goody/core/presentation/utils/constants.dart';
import 'package:health_goody/core/presentation/utils/message_generator.dart';
import 'package:health_goody/core/presentation/utils/theme.dart';
import 'package:health_goody/core/presentation/widgets/animated_container.dart';
import 'package:health_goody/core/presentation/widgets/signin_method_circle.dart';
import 'package:animated_pin_input_text_field/animated_pin_input_text_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, MessageGenerator.getLabel('verify-otp')),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: maxScreenWidth,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(MessageGenerator.getLabel("verify-otp"),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: 5.h),
              Text(
                MessageGenerator.getMessage('auth-verifyotp-message'),
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey),
              ),
              Text(
                'example@gmail.com',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: appColors.primaryColor, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: PinInputTextField(
                  automaticFocus: false,
                  aspectRatio: 1,
                  pinLength: 4,
                  textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  onChanged: (String value) {
                    appLogger.i(value);
                  },
                ),
              ),
              Text(
                "Don't recieve otp ?",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey),
              ),
              Text(
                "Resend Otp",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: appColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 10.h),
              AnimatedClickableTextContainer(
                  iconSrc: '',
                  title: 'Verify',
                  press: () {},
                  bgColor: appColors.primaryColor)
            ],
          ),
        ),
      ),
    );
  }
}
