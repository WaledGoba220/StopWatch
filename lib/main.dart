import 'package:flutter/material.dart';
import 'package:stop_watch/screens/home_screen.dart';
import 'package:stop_watch/screens/login_screen.dart';
import 'package:stop_watch/screens/stop_watch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: "StopWatch",
      routes: {
        "/": (context) => const LoginScreen(),
        LoginScreen.route: (context) => const LoginScreen(),
        StopwatchScreen.route: (context) => const StopwatchScreen(),
      },
      initialRoute: "/",
    );
  }
}
