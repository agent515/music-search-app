import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_search_app/data/services/auth_service.dart';
import 'package:music_search_app/presentation/screens/authentication/sign_in_screen.dart';
import 'package:music_search_app/presentation/screens/authentication/sign_up_screen.dart';
import 'package:music_search_app/presentation/screens/dashboard/dashboard_screen.dart';

class AuthBuilder extends ConsumerWidget {
  const AuthBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    User? user = ref.watch(authService).currentUser;
    bool signInForm = ref.watch(authService).signInForm;
    print("currentUser: $user");

    if (user == null) {
      return (signInForm) ? const SignInScreen() : const SignUpScreen();
    } else {
      return DashboardScreen(username: user.uid);
    }
  }
}
