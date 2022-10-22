import 'package:flutter/material.dart';

import 'package:client_app/screens/screens.dart';

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
    return MaterialApp(
      title: 'Basic AUTH with Flutter + FastAPI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpPage()
    );
  }
}
