import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gossip_v01/service/AuthService.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final void Function()? loginPage;

  RegisterPage({super.key, this.loginPage});

  void register(BuildContext context) async {
    final AuthService _auth = AuthService();
    UserCredential newUser = await _auth.signUpWithUserAndPassword(
      _emailController.text,
      _passController.text,
    );
    // .whenComplete(() => AlertDialog(
    //     title: Text(this.),
    // ),);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:
            // ignore: unnecessary_null_comparison
            Text(newUser != null ? "Created successfully" : "Created failed"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(
            height: 51,
          ),
          Text(
            "Let's create account to access Gossip !!!",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 16),
          ),
          const SizedBox(
            height: 27,
          ),
          MyTextField(
            hintText: "Email",
            obscureText: false,
            controller: _emailController,
          ),
          const SizedBox(
            height: 27,
          ),
          MyTextField(
            hintText: "Password",
            obscureText: true,
            controller: _passController,
          ),
          const SizedBox(
            height: 27,
          ),
          MyButton(
            textBnt: "Register",
            onTap: () => register(context),
          ),
          const SizedBox(
            height: 27,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account ? ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              GestureDetector(
                onTap: loginPage,
                child: Text(
                  "Login now !",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
