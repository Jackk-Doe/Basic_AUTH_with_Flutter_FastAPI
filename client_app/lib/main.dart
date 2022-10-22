import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:client_app/screens/screens.dart';
import 'package:client_app/providers/providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
