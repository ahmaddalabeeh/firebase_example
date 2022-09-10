import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_text_form_field.dart';
import '../../widgets/styled_button.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/loginScreen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.emailController = TextEditingController();
    authProvider.passwordController = TextEditingController();
  }

  @override
  void dispose() {
    authProvider.emailController.dispose();
    authProvider.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            controller: authProvider.emailController,
            type: TextInputType.emailAddress,
            hint: "Please enter your email address",
            empty: "Your E-mail address",
            icon: const Icon(Icons.email),
            txt: false,
          ),
          CustomTextFormField(
            controller: authProvider.passwordController,
            type: TextInputType.visiblePassword,
            hint: "Please enter your password",
            empty: "Password",
            icon: const Icon(Icons.password),
            txt: true,
          ),
          StyledButton(
            onPressed: () {
              authProvider.loginWithEmailAndPassword(context);
            },
            child: const Icon(Icons.login),
          )
        ],
      )),
    );
  }
}
