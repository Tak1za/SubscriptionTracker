import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscriber/screens/home_screen.dart';
import 'package:subscriber/state/service_manager.dart';
import 'package:subscriber/state/subscription_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const _primaryColor = Color(0xFF000000);
  static const _accentColor = Color(0xFF1976D2);
  static const _selectedColor = Colors.blue;
  static const _formBackgroundColor = Color(0xFF232323);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => SubscriptionManager(),
          ),
          ChangeNotifierProvider(
            create: (_) => ServiceManager(),
          )
        ],
        child: MaterialApp(
          title: 'Subscriber',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: _primaryColor,
            accentColor: _accentColor,
            scaffoldBackgroundColor: _formBackgroundColor,
            selectedRowColor: _selectedColor,
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
