import 'package:client_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _logOut() {
    // TODO : LogOut account
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home Page", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 35),

            const Text("Username : something", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 15),

            const Text("Email : something@something.com", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 15),

            const Text("Account ID : someID", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 30),

            CustomElevatedButton(
              onPressfunc: _logOut,
              buttonText: "Log out",
            ),
          ],
        ),
      ),
    );
  }
}