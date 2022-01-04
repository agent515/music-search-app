import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_search_app/data/models/app_user.dart';
import 'package:music_search_app/presentation/providers/auth_service.dart';
import 'package:music_search_app/presentation/screens/authentication/sign_in_screen.dart';
import 'package:music_search_app/presentation/screens/authentication/sign_up_screen.dart';
import 'package:music_search_app/presentation/screens/dashboard/dashboard_screen.dart';

class AuthBuilder extends ConsumerWidget {
  const AuthBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    AppUser? user = ref.watch(authService).currentUser;
    bool signInForm = ref.watch(authService).signInForm;
    print("App user: $user");

    if (user == null) {
      return (signInForm) ? const SignInScreen() : const SignUpScreen();
    } else {
      return DashboardScreen();
    }
  }
}
