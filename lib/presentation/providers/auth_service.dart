import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music_search_app/data/models/app_user.dart';
import 'package:music_search_app/presentation/providers/database_service.dart';
import 'package:music_search_app/presentation/providers/songs_provider.dart';

final authService = ChangeNotifierProvider((ref) => AuthService(ref.read));

class AuthService extends ChangeNotifier {
  final Reader _reader;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _currentUser;
  String? _errorMessage;
  bool _loading = false;
  bool _signInForm = true;

  AuthService(this._reader);

  AppUser? get currentUser => _currentUser;

  String? get errorMessage => _errorMessage;

  bool get loading => _loading;

  bool get signInForm => _signInForm;

  set signInForm(val) {
    _signInForm = val;
    notifyListeners();
  }

  Future<void> initialize() async {
    _auth.userChanges().listen((user) async {
      if (user != null) {
        _currentUser = await _reader(databaseService).getUser(user.uid);
        _reader(songsProvider).favSongsList.clear();
        _reader(songsProvider).favSongsList.addAll(_currentUser!.favoriteList);
      } else {
        _currentUser = null;
      }
      notifyListeners();
      print("CURRENT USER: $user");
    });
  }

  Future<void> showToast(String message) async {
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  Future<void> signUpWithEmailAndPassword({
    required name,
    required email,
    required password,
  }) async {
    try {
      _loading = true;
      notifyListeners();

      // Register user to Firebase
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? _firebaseUser = credential.user;
      if (_firebaseUser == null) {
        throw Exception('SIGN UP FAILED');
      }
      // Save User data on firestore
      AppUser user = AppUser(uid: _firebaseUser.uid, name: name, email: email);
      await _reader(databaseService).registerUser(user);

      _signInForm = true;
      _loading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _authExceptionHelper(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required email, required password}) async {
    try {
      _loading = true;
      notifyListeners();

      await _auth.signInWithEmailAndPassword(email: email, password: password);

      _loading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _authExceptionHelper(e);
    }
  }

  Future<void> signOut() async {
    try {
      _loading = true;
      notifyListeners();

      await _auth.signOut();

      _loading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _authExceptionHelper(e);
    }
  }

  _authExceptionHelper(e) {
    _errorMessage = getErrorMessage(e);
    showToast(_errorMessage!);
    _loading = false;
    notifyListeners();
  }

  String? validateEmail(String? val) {
    if (val == '') return 'Field cannot be empty.';
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val!);
    if (!emailValid) return 'Email is not valid.';
  }

  String? validatePassword(String? val) {
    if (val == '') return 'Field cannot be empty.';
    if (val!.length < 6) {
      return 'Password must contain at least 6 chars.';
    }
  }

  String? genericValidator(String? val) {
    if (val == '') {
      return 'Field cannot be empty.';
    } else {
      return null;
    }
  }

  String getErrorMessage(FirebaseAuthException e) {
    print(e.code);
    switch (e.code) {
      case 'invalid-email':
        return "Email id is invalid.";
      case 'email-already-in-use':
        return "Email is already in use.";
      case 'user-disabled':
        return "User is disabled.";
      case 'user-not-found':
        return "User not found.";
      case 'wrong-password':
        return "Password is incorrect.";
      case 'operation-not-allowed':
        return "Operation is not allowed.";
      case 'weak-password':
        return "Password must contain at least 6 chars.";
      default:
        'Authentication failed.';
    }
    return '';
  }
}
