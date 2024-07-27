import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:health_goody/core/presentation/utils/constants.dart';
import 'package:health_goody/core/presentation/utils/image_paths.dart';
import 'package:health_goody/core/presentation/utils/message_generator.dart';
import 'package:health_goody/core/presentation/utils/theme.dart';
import 'package:health_goody/core/presentation/widgets/animated_container.dart';
import 'package:health_goody/core/presentation/widgets/drop_down.dart';
import 'package:health_goody/core/presentation/widgets/textformfield.dart';

class SignupAuthImage extends StatelessWidget {
  SignupAuthImage({super.key});

  final TextEditingController ageController = TextEditingController();
  final ValueNotifier<String?> _selectedGender = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
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
                MessageGenerator.getLabel('profile'),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: maxScreenWidth,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(MessageGenerator.getLabel("auth-complete-profile"),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(height: 5.h),
                Text(
                  MessageGenerator.getMessage('auth-complete-profile-message'),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 20.h),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50.h,
                      backgroundColor: appColors.inputBgFill,
                      child: SvgPicture.asset(
                        ImagePaths.personSvg,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 5,
                      child: CircleAvatar(
                        backgroundColor: appColors.primaryColor,
                        radius: 13.h,
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 14.h,
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h),
                    Text(MessageGenerator.getLabel('age'),
                        textAlign: TextAlign.end),
                    SizedBox(height: 5.h),
                    TextFormFieldWid(
                        controller: ageController,
                        hintText:
                            MessageGenerator.getMessage('user-enter-age')),
                    Text(MessageGenerator.getLabel('Gender'),
                        textAlign: TextAlign.end),
                    SizedBox(height: 5.h),
                    CustomDropdown(
                        hintText:
                            MessageGenerator.getMessage('auth-select-gender'),
                        selectedValue: _selectedGender,
                        index: 0),
                    SizedBox(height: 15.h),
                    AnimatedClickableTextContainer(
                      iconSrc: '',
                      title: MessageGenerator.getLabel('create-account'),
                      press: () => context.push('otp'),
                      bgColor: appColors.pleasantButtonBg,
                    ),
                    SizedBox(height: 20.h),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
