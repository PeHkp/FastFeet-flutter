import 'package:fast_feet/pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:fast_feet/pages/forgot_password/forgot_password_page.dart';
import 'package:fast_feet/pages/home/home_page.dart';
import 'package:fast_feet/pages/login/bloc/login_bloc.dart';
import 'package:fast_feet/pages/login/login_page.dart';
import 'package:fast_feet/pages/register/bloc/register_bloc.dart';
import 'package:fast_feet/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  Routes._();

  static GlobalKey<NavigatorState>? navigatorkey = GlobalKey<NavigatorState>();

  static const String login = '/login';
  static const String home = '/home';
  static const String register = '/register';
  static const String forgotPassword = '/forgot_password';

  static Map<String, Widget Function(BuildContext)> routes = {
    login: (context) => BlocProvider(
          create: (_) => LoginBloc(),
          child: LoginPage(),
        ),
    register: (context) => BlocProvider(
          create: (_) => RegisterBloc(),
          child: RegisterPage(),
        ),
    forgotPassword: (context) => BlocProvider(
          create: (_) => ForgotPasswordBloc(),
          child: ForgotPasswordPage(),
        ),
    home: (context) => HomePage(),
  };
}
