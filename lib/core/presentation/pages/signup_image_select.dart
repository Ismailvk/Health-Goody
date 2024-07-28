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
import 'package:health_goody/core/presentation/widgets/signin_method_circle.dart';
import 'package:health_goody/core/presentation/widgets/textformfield.dart';

class SignupAuthImage extends StatelessWidget {
  SignupAuthImage({super.key});

  final TextEditingController ageController = TextEditingController();
  final ValueNotifier<String?> _selectedGender = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, MessageGenerator.getLabel('profile')),
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
                      child: InkWell(
                        onTap: () => showImagePickerBottomSheet(context),
                        child: CircleAvatar(
                          backgroundColor: appColors.primaryColor,
                          radius: 13.h,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 14.h,
                          ),
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
                      press: () => context.push('/otp'),
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

  void showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 140.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Choose your image',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.camera, size: 40),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text('Camera')
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.photo_library, size: 40),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text('Gallery')
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
