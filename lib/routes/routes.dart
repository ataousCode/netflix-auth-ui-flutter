import 'package:flutter/widgets.dart';
import 'package:netflix_auth/screens/auth_screen.dart';
import 'package:netflix_auth/screens/reset_password_screen.dart';

class AppRoutes {
  static const String auth = '/';
  static const String resetPassword = '/rest-password';

  static Map<String, WidgetBuilder> get routes => {
    auth: (context) => const AuthScreen(),
    resetPassword: (context) => ResetPasswordScreen(),
  };
}
