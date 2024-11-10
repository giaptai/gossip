import 'package:flutter/material.dart';
import 'package:gossip_v01/pages/login.dart';
import 'package:gossip_v01/pages/register.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLogin = true;
  void togglePages() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLogin
        ? LoginPage(
            registerPage: togglePages,
          )
        : RegisterPage(
            loginPage: togglePages,
          );
  }
}
