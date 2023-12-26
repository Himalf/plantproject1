import 'package:flutter/material.dart';
import 'package:my_app/pages/landing_page.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 74, 195, 96)),
        scaffoldBackgroundColor: Color.fromARGB(255, 202, 254, 237),
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}
