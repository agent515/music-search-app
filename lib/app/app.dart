import 'package:flutter/material.dart';
import 'package:music_search_app/core/routes/routes.dart';
import 'package:music_search_app/core/theme/app_theme.dart';
import 'package:music_search_app/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:music_search_app/presentation/screens/favorites/favorites_screen.dart';
import 'package:music_search_app/presentation/screens/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Symphony',
      theme: AppTheme.dark(),
      initialRoute: '/',
      onGenerateRoute: Routes.routes,
    );
  }
}
