import 'package:flutter/material.dart';
import 'package:music_search_app/core/theme/app_theme.dart';
import 'package:music_search_app/presentation/screens/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Symphony',
      theme: AppTheme.dark(),
      home: const SplashScreen(),
    );
  }
}
