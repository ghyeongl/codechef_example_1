import 'package:flutter/material.dart';
import 'package:codechef_example_1/screens/main_screen.dart';

// Overview: Run MyApp on main
void main() {
  runApp(MyApp());
}

// MyApp is the
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginSignupScreen(),
      // Summary: title - Chatting app, theme - blue, home - main_screen
    );
  }
}
