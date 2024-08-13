import 'package:flutter/material.dart';
import 'package:health_goody/core/presentation/pages/dummy_screen.dart';
import 'package:health_goody/core/presentation/pages/otp_scree.dart';
import 'package:health_goody/core/presentation/pages/signin_screen.dart';
import 'package:health_goody/core/presentation/pages/signup_image_select.dart';
import 'package:health_goody/core/presentation/pages/signup_screen.dart';
import 'package:health_goody/core/presentation/pages/splash_screen.dart';
import 'package:health_goody/core/presentation/utils/widget_helper.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  errorBuilder: (context, state) => const DummyScreen(text: "Error Screen"),
  // redirect: (BuildContext context, GoRouterState state) {
  //   if (!["/home", "/signin", "/forgotPassword", "/signup"]
  //       .contains(state.fullPath)) {
  //     // if any routes which needs auth, check for auth
  //     bool auth = Random().nextBool();
  //     if (!auth) {
  //       // if not authenticated, show signin screen
  //       return '/signin';
  //     } else {
  //       // if authenticated, proceed
  //       return null;
  //     }
  //   } else {
  //     // for any screens which not need auth, proceed
  //     return null;
  //   }
  // },
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'splash',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const SplashScreen(),
          ),
        ),
        GoRoute(
          path: 'signin',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const SigninScreen(),
          ),
        ),
        GoRoute(
          path: 'signup',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: SignupScreen(),
          ),
        ),
        GoRoute(
          path: 'signupAuthImage',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: SignupAuthImage(),
          ),
        ),
        GoRoute(
          path: 'otp',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const OtpScreen(),
          ),
        ),
        GoRoute(
          path: 'forgotPassword',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const DummyScreen(text: "Forgot Password Screen"),
          ),
        ),
        GoRoute(
          path: 'home',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const DummyScreen(text: "Home Screen"),
          ),
        ),
      ],
    ),
  ],
);
