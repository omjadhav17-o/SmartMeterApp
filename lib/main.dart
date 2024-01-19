import 'package:flutter/material.dart';
import 'package:smartmeterapp/Screens/auth.dart';

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
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(212, 170, 32, 172)),
        useMaterial3: true,
      ),
      home: const AuthScreen(),
    );
  }
}
