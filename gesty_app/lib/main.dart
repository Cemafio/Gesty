import 'package:flutter/material.dart';
import 'package:gesty_app/page/first.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF8B12B1),
        scaffoldBackgroundColor: Color(0xFF1E1E1E),
      ),
      home: FirstPage(),
    );
  }
}

