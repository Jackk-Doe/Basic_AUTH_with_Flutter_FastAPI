import 'package:client_app/providers/user_provider.dart';
import 'package:client_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _logOut() {
    // TODO : LogOut User
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user!;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home Page", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 35),

            Text("Username : ${user.username}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 15),

            Text("Email : ${user.email}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 15),

            Text("JWT token : ${user.token}", style: const TextStyle(fontSize: 18)),
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