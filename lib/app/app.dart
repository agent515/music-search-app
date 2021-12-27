import 'package:flutter/material.dart';
import 'package:music_search_app/core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Symphony',
      theme: AppTheme.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Symphony'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
