// This file contains Navigation details such as NamedRoutes, RouteBuilder, etc.
import 'package:flutter/material.dart';
import 'package:music_search_app/presentation/screens/authentication/auth_builder.dart';
import 'package:music_search_app/presentation/screens/authentication/sign_in_screen.dart';
import 'package:music_search_app/presentation/screens/authentication/sign_up_screen.dart';
import 'package:music_search_app/presentation/screens/favorites/favorites_screen.dart';
import 'package:music_search_app/presentation/screens/splash_screen/splash_screen.dart';

class Routes {
  static Route routeBuilder(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }

  static Route? routes(RouteSettings settings) {
    Map<String, dynamic>? map;
    if (settings.arguments != null) {
      map = settings.arguments as Map<String, dynamic>;
    }
    switch (settings.name) {
      case '/':
        return routeBuilder(const SplashScreen());
      case '/signIn':
        return routeBuilder(const SignInScreen());
      case '/signUp':
        return routeBuilder(const SignUpScreen());
      case '/home':
        return routeBuilder(const AuthBuilder());
      case '/favorites':
        return routeBuilder(const FavoritesScreen());
      default:
        return routeBuilder(const Scaffold(
          body: Center(child: Text('404')),
        ));
    }
  }
}
