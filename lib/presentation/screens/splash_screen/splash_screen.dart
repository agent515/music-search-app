import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          Center(
            child: Image(
              image: AssetImage('assets/img/app_logo.png'),
              height: 250,
            ),
          ),
        ],
      ),
    );
  }
}
