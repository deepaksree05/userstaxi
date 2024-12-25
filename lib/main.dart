import 'package:flutter/material.dart';
import 'package:users/screens/main_screen.dart';
import 'package:users/screens/register_screen.dart';
import 'package:users/splashscreen/splash_screen.dart';
import 'package:users/themprovider/them_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
    themeMode: ThemeMode.system,
      theme: MyThemes.lightThem,
      darkTheme: MyThemes.darkthem,
      debugShowCheckedModeBanner: false,
      home: RegisterScreen()
    );
  }
}


//splashscreen