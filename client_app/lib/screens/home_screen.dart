import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:client_app/providers/providers.dart';
import 'package:client_app/services/services.dart';
import 'package:client_app/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _logOut() async {
    bool removeSuccess = await LocalStoreServices.removeFromLocal(context);
    if (removeSuccess) {
      if (!mounted) return;
      Provider.of<UserProvider>(context, listen: false).setUserNull();
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: false).user;

    if (user == null) {
      return const Center(child: CircularProgressIndicator());
    }

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