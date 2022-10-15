import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  void signUp() {}

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

            CustomElevatedButton(onPressfunc: signUp, buttonText: 'Sign Up'),
            const SizedBox(height: 10),

            TextButton(
              onPressed: () {
                // TODO : Change to SignIn page
              },
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
