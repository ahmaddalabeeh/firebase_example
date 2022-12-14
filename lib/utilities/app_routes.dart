import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/login_screen/login_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'package:flutter_application_1/screens/splash_screen.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
};
