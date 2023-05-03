import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/pages/mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      initialRoute: MainScreen.route,
      routes: {
        MainScreen.route: (context) => MainScreen(),
      },
    );
  }
}
