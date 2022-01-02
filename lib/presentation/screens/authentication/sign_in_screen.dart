import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_search_app/core/constants/color_constants.dart';
import 'package:music_search_app/presentation/providers/auth_service.dart';
import 'package:music_search_app/presentation/shared_widgets/loader/loading_indicator_overlay.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailFocus.requestFocus();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      print("valid");
      ref.read(authService).signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
    } else {
      print("Invalid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Sign in',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 60),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      focusNode: _emailFocus,
                      controller: _emailController,
                      decoration: InputDecoration(
                        label: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.darkPink),
                        ),
                        focusColor: AppColors.darkPink,
                        hintText: 'email',
                      ),
                      cursorColor: Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedItemColor,
                      onFieldSubmitted: (_) {
                        _passwordFocus.requestFocus();
                      },
                      validator: ref.read(authService).validateEmail,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      focusNode: _passwordFocus,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        label: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.darkPink),
                        ),
                        focusColor: AppColors.darkPink,
                        hintText: 'password',
                      ),
                      cursorColor: Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedItemColor,
                      onFieldSubmitted: (_) {
                        _passwordFocus.unfocus();
                        _onSubmit();
                      },
                      validator: ref.read(authService).validatePassword,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                const StadiumBorder()),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 8.0)),
                            backgroundColor: MaterialStateProperty.all(
                              AppColors.lightPurple,
                            ),
                          ),
                          onPressed: _onSubmit,
                          child: Text(
                            'Sign in',
                            style: Theme.of(context).textTheme.headline5,
                          )),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        InkWell(
                          onTap: () {
                            ref.read(authService).signInForm = false;
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Sign up',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkPink),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          if (ref.watch(authService).loading) const LoadingIndicatorOverlay()
        ],
      ),
    );
  }
}
