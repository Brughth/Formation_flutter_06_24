import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  final userRef = FirebaseFirestore.instance.collection("users");

  register({
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
    };
    return setUser(
      userId: credential.user!.uid,
      data: data,
    );
  }

  login({
    required String email,
    required String password,
  }) async {
    UserCredential credential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return getUser(credential.user!.uid);
  }

  setUser({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    await userRef.doc(userId).set(data, SetOptions(merge: true));
    return getUser(userId);
  }

  getUser(String id) async {
    var res = (await userRef.doc(id).get()).data() as Map<String, dynamic>;
    res.addAll({
      "id": id,
    });

    return UserInfo.fromJson(res);
  }
}
