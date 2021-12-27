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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Image(
              image: AssetImage('assets/img/app_logo.png'),
              height: 250,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home',
                    arguments: {'uid': '123'});
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Go to Home'),
              ))
        ],
      ),
    );
  }
}
