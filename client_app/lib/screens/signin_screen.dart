import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:client_app/screens/screens.dart';
import 'package:client_app/widgets/widgets.dart';
import 'package:client_app/services/services.dart';
import 'package:client_app/models/models.dart';
import 'package:client_app/providers/user_provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  Future<void> _signInSuccess(User userData) async {
    bool isSaveSuccess = await LocalStoreServices.saveInLocal(context, userData);
      if (isSaveSuccess) {
        if (!mounted) return;
        UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUserFromModel(userData);
      }
  }

  /// Trigger this when "Sign In" button is clicked
  void _signIn() async {
    // NOTE : If signing-ip failed, return null
    User? userAccount = await AuthService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );

    // NOTE : Process belows, if Sign-Ip via API successfully
    if (userAccount != null) {
      await _signInSuccess(userAccount);
      if (!mounted) return;
      Navigator.of(context).pop();
    }
  }

  /// Change to SignUp Page
  void _changeToSignUp() {
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (context) => const SignUpPage()),
    // );
    Navigator.of(context).pop();
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