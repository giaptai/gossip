import 'package:flutter/material.dart';
import 'package:gossip_v01/components/my_button.dart';
import 'package:gossip_v01/components/my_textfield.dart';
import 'package:gossip_v01/service/AuthService.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final void Function()? registerPage;
  LoginPage({super.key, this.registerPage});

  //method LOGIN
  void login(BuildContext context) async {
    final AuthService authService = new AuthService();
    try {
      await authService.signInWithUserAndPassword(
        _emailController.text,
        _passController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error: " + e.toString()),
        ),
      );
    }
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
          Text(
            "Welcome to Gossip !!!",
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
            textBnt: "Login",
            onTap: () => login(context),
          ),
          const SizedBox(
            height: 27,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have a account ? ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              GestureDetector(
                onTap: registerPage,
                child: Text(
                  "Register now !",
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
