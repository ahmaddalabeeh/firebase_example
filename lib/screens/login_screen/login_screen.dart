import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen/login_screen_components/components.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/loginScreen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          textFormField(
              TextInputType.visiblePassword,
              "Please enter your email address",
              "Your E-mail address",
              Icon(Icons.email),
              false),
          textFormField(
              TextInputType.emailAddress,
              "Please enter your password",
              "Password",
              Icon(Icons.password),
              true),
          StyledButton(
            child: Icon(Icons.login),
          )
        ],
      )),
    );
  }
}
