import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_search_app/data/models/app_user.dart';

final databaseService = ChangeNotifierProvider((ref) => DatabaseService());

class DatabaseService extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<AppUser> _usersRef;

  DatabaseService() {
    _usersRef = _firestore.collection('users').withConverter<AppUser>(
        fromFirestore: (snapshots, _) => AppUser.fromJson(snapshots.data()!),
        toFirestore: (user, _) => user.toJson());
  }

  Future<void> registerUser(AppUser user) async {
    _usersRef.doc(user.uid).set(user);
  }

  Future<AppUser?> getUser(String uid) async {
    DocumentSnapshot<AppUser> snapshot = await _usersRef.doc(uid).get();
    AppUser? user = snapshot.data();
    return user;
  }

  Future<AppUser?> updateUser(AppUser user) async {
    _usersRef.doc(user.uid).update(user.toJson());
  }
}
