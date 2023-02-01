import 'package:flutter/material.dart';
import 'package:fluttertesting/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: "/contact",
      routes: {
        // "/splash": (context) => SplashPage(),
        // "/home": (context) => HomePage(),
        "/tutorial": (context) => const TutorialPage(),
        "/contact": (context) => const ContactPage(),
      },
    );
  }
}
