import 'package:flutter/material.dart';

import '../screens/dashboard_screen.dart';
import '../screens/sign_in_screen.dart';
import '../screens/sign_up_screen.dart';

class AppRoutes {
  static const signIn = '/signin';
  static const signUp = '/signup';
  static const dashboard = '/dashboard';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case signIn:
        page = const SignInScreen();
        break;
      case signUp:
        page = const SignUpScreen();
        break;
      case dashboard:
        page = const DashboardScreen();
        break;
      default:
        page = const SignInScreen();
    }

    return PageRouteBuilder<void>(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (_, animation, secondaryAnimation) => page,
      transitionsBuilder: (_, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        return FadeTransition(
          opacity: curved,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.04, 0),
              end: Offset.zero,
            ).animate(curved),
            child: child,
          ),
        );
      },
    );
  }
}
