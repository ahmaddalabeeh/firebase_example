import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/styled_button.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = "/register";
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

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
              authProvider.createWithEmailAndPassword(context);
            },
            child: const Icon(Icons.app_registration),
          )
        ],
      )),
    );
  }
}
