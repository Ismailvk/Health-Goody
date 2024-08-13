import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    loginCheck(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Image.asset(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        'assets/images/Health Goody.gif',
        fit: BoxFit.cover,
      ),
    );
  }

  loginCheck(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 10));
    context.go('/signin');
  }
}
