import 'package:flutter/material.dart';
import 'package:instastyle/core/theme/theme.dart';
import 'package:instastyle/feature/home/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaStyle',
      theme: AppTheme.light(),
      // darkTheme: AppTheme.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

