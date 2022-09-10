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
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.emailController = TextEditingController();
    authProvider.passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
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
          child: Form(
        key: formKey,
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
                if (formKey.currentState?.validate() ?? false) {
                  authProvider.loginWithEmailAndPassword(context);
                }
              },
              child: const Icon(Icons.login),
            )
          ],
        ),
      )),
    );
  }
}
