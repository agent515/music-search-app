import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushReplacementNamed(context, '/home',
            arguments: {'uid': '123'}));

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
