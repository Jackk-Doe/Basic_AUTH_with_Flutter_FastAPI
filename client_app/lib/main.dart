import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:client_app/screens/screens.dart';
import 'package:client_app/providers/providers.dart';
import 'package:client_app/models/models.dart';
import 'package:client_app/services/services.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  /// In the widget Initialising process, if [token] is found in-divice
  /// get User data from backend, then notify UserProvider
  void _getUserData() async {
    String? existedToken = await LocalStoreServices.getFromLocal(context);
    if (existedToken != null) {
      User? user = await AuthService.getUser(context: context, token: existedToken);
      if (user != null) {
        if (!mounted) return null;
        Provider.of<UserProvider>(context, listen: false).setUserFromModel(user);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic AUTH with Flutter + FastAPI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.user != null) {
            return const HomePage();
          }

          return const SignUpPage();
        },
      ),
    );
  }
}
