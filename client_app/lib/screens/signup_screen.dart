import 'package:client_app/screens/screens.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  void _signUp() {
    // TODO : SignIn function
  }

  void _changeToSignIn() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignInPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sign-up an account", style: TextStyle(fontSize: 28)),
            const SizedBox(height: 30),

            CustomTextField(controller: _usernameController, hintText: "Type Username"),
            const SizedBox(height: 15),

            CustomTextField(controller: _emailController, hintText: "Type Email"),
            const SizedBox(height: 15),

            CustomTextField(controller: _passwordController, hintText: "Type Password"),
            const SizedBox(height: 15),

            CustomTextField(controller: _confirmPasswordController, hintText: "Confirm Password"),
            const SizedBox(height: 30),

            CustomElevatedButton(onPressfunc: _signUp, buttonText: 'Sign Up'),
            const SizedBox(height: 10),

            TextButton(
              onPressed: _changeToSignIn,
              child: const Text(
                'go to Login user',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
