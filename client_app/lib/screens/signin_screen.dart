import 'package:flutter/material.dart';

import 'package:client_app/screens/screens.dart';
import 'package:client_app/widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  void _signIn() {
    // TODO : SignIn function
  }

  void _changeToSignUp() {
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sign-In into user account", style: TextStyle(fontSize: 28)),
            const SizedBox(height: 40),

            CustomTextField(controller: _emailController, hintText: "User email"),
            const SizedBox(height: 15),

            CustomTextField(controller: _passwordController, hintText: "User password"),
            const SizedBox(height: 35),

            CustomElevatedButton(onPressfunc: _signIn, buttonText: 'Sign In'),
            const SizedBox(height: 10),

            TextButton(
              onPressed: _changeToSignUp,
              child: const Text(
                'go to Create user accout',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}