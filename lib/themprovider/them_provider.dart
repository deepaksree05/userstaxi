import 'package:flutter/material.dart';

 class MyThemes{

   static final darkthem = ThemeData(
     scaffoldBackgroundColor: Colors.grey.shade900,
         colorScheme: ColorScheme.dark(),
   );
   static final lightThem = ThemeData(
     scaffoldBackgroundColor: Colors.white,
     colorScheme: ColorScheme.light(),
   );

 }