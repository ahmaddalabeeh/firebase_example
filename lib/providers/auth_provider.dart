import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/login_screen/login_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';

class AuthProvider with ChangeNotifier {
  late TextEditingController emailController, passwordController;

  User? get currentUser => FirebaseAuth.instance.currentUser;

  bool get isLoggedIn => currentUser != null;

  Future<void> loginWithEmailAndPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      if (isLoggedIn) {
        Navigator.pushNamed(
          context,
          HomeScreen.routeName,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Navigator.pushNamed(
          context,
          RegisterScreen.routeName,
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> createWithEmailAndPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      Navigator.pushNamed(
        context,
        HomeScreen.routeName,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Navigator.pushNamed(
          context,
          LoginScreen.routeName,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void loginWithGoogle() {
    print("login with google");
  }

  void loginWithFacebook() {
    print("login with facebook");
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
