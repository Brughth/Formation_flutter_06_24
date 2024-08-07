import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formation_flutter_join24/auth/data/user_model.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  final userRef = FirebaseFirestore.instance.collection("users");

  Future<UserModel> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    var data = {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "uid": credential.user!.uid,
    };
    return setUser(
      userId: credential.user!.uid,
      data: data,
    );
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    UserCredential credential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return getUser(credential.user!.uid);
  }

  Future<UserModel?> checkAuthState() async {
    var currentUser = auth.currentUser;
    if (currentUser == null) {
      return null;
    }

    return await getUser(currentUser.uid);
  }

  Future<UserModel> setUser({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    await userRef.doc(userId).set(data, SetOptions(merge: true));
    return getUser(userId);
  }

  Future<UserModel> getUser(String id) async {
    var res = (await userRef.doc(id).get()).data() as Map<String, dynamic>;

    return UserModel.fromJson(res);
  }

  logout() async {
    await auth.signOut();
  }
}
