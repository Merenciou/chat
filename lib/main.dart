import 'package:chat/chat.dart';
import 'package:flutter/material.dart';
import './login.dart';
import './signup.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  State<MainApp> createState() => _MainApp();
}

class _MainApp extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/loginpage': (context) => const LoginPage(),
        '/chatpage': (context) => const ChatPage(),
        '/signuppage': (context) => const SignUp(),
      },
      home: const LoginPage(),
    );
  }
}
