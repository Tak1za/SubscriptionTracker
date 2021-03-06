import 'package:flutter/material.dart';
import 'package:subscriber/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const _primaryColor = Color(0xFF000000);
  static const _accentColor = Color(0xFF242424);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subscriber',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
      ),
      home: HomeScreen(),
    );
  }
}
