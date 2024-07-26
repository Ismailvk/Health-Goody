import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_goody/core/presentation/blocs/auth/authentication_bloc.dart';
import 'package:health_goody/core/presentation/utils/constants.dart';
import 'package:health_goody/core/presentation/utils/image_paths.dart';
import 'package:health_goody/core/presentation/utils/message_generator.dart';
import 'package:health_goody/core/presentation/utils/progress_dialogue.dart';
import 'package:health_goody/core/presentation/utils/theme.dart';
import 'package:health_goody/core/presentation/utils/widget_helper.dart';
import 'package:health_goody/core/presentation/widgets/animated_container.dart';
import 'package:health_goody/core/presentation/widgets/signin_method_circle.dart';
import 'package:health_goody/core/presentation/widgets/textformfield.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_linkify/flutter_linkify.dart';
// import 'package:url_launcher/url_launcher.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthenticationBloc _bloc = AuthenticationBloc();
  CustomProgressDialog? _progressDialog;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _bloc,
      listener: (ctx, state) {
        appLogger.i(state);

        _progressDialog?.hide();

        if (state is LoadingState) {
          _progressDialog = CustomProgressDialog(context);
          _progressDialog?.show(
            title: state.loadingInfo.title,
            message: state.loadingInfo.message,
          );
        } else if (state is AuthErrorState) {
          showSingleButtonAlertDialog(
              context: context, title: state.title, message: state.message);
        } else if (state is AuthSignedInState) {
          context.go("/home");
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          bloc: _bloc,
          builder: (ctx, state) {
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
                        SizedBox(height: 32.h),
                        Text(MessageGenerator.getMessage("auth-signin"),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineSmall),
                        SizedBox(height: 5.h),
                        Text(
                          MessageGenerator.getMessage('auth-signin-message'),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.grey),
                        ),
                        SizedBox(height: 28.h),
                        Text(MessageGenerator.getLabel('email')),
                        SizedBox(height: 5.h),
                        TextFormFieldWid(
                            controller: _emailController,
                            hintText:
                                MessageGenerator.getLabel('user@domain.com')),
                        SizedBox(height: 8.h),
                        Text(MessageGenerator.getLabel('password')),
                        SizedBox(height: 5.h),
                        TextFormFieldWid(
                            isSufix: true,
                            controller: _passwordController,
                            hintText: MessageGenerator.getLabel('user@123')),
                        SizedBox(height: 5.h),
                        RichText(
                          textAlign: TextAlign.end,
                          text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(),
                            children: <TextSpan>[
                              TextSpan(
                                  text: MessageGenerator.getLabel(
                                      'Forgot Password'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                          color: appColors.pleasantButtonBg),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.go("/forgotPassword");
                                    }),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h),
                        AnimatedClickableTextContainer(
                          title: MessageGenerator.getLabel('Sign In'),
                          iconSrc: '',
                          bgColor: appColors.pleasantButtonBg,
                          press: () {
                            submitCredentials();
                          },
                        ),
                        SizedBox(height: 30.h),
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
                              MessageGenerator.getMessage(
                                  'auth-signin-methods'),
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
                        SizedBox(height: 40.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SignInCircleWid(
                                imagePath: ImagePaths.facebookSvg),
                            SizedBox(width: 8.w),
                            const SignInCircleWid(
                                imagePath: ImagePaths.googleSvg),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: MessageGenerator.getMessage(
                                'auth-signin-no-account'),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(),
                            children: <TextSpan>[
                              TextSpan(
                                  text: MessageGenerator.getLabel('Sign Up'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(color: Colors.red),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.go("/signup");
                                    }),
                            ],
                          ),
                        ),

                        // Linkify(
                        //   onOpen: (link) async {
                        //     if (!await launchUrl(Uri.parse(link.url))) {}
                        //   },
                        //   text: MessageGenerator.getMessage(
                        //       "auth-visit-site-guide"),
                        //   textAlign: TextAlign.center,
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .labelSmall
                        //       ?.copyWith(),
                        //   linkStyle: Theme.of(context)
                        //       .textTheme
                        //       .labelSmall
                        //       ?.copyWith(color: appColors.linkTextColor),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  void submitCredentials() {
    _bloc.add(AuthSignInEvent(_emailController.text, _passwordController.text));
  }
}
