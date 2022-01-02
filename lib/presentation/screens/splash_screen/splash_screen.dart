import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_search_app/data/services/auth_service.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await initialize();
      await Future.delayed(const Duration(seconds: 1));

      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: {'username': 'Rohit'},
      );
    });
  }

  Future<void> initialize() async {
    await ref.read(authService).initialize();
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 3))
    //     .then((value) => Navigator.pushReplacementNamed(
    //           context,
    //           '/home',
    //           arguments: {'username': 'Rohit'},
    //         ));

    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/img/app_logo.png'),
          height: 250,
        ),
      ),
    );
  }
}
