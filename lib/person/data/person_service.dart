import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:formation_flutter_join24/person/data/person_model.dart';

import '../../shared/const.dart';

class PersonService {
  final storageRef = FirebaseStorage.instance.ref();

  Future<PersonModel> getPerson(String id) async {
    var data = (await personsRef.doc(id).get()).data();

    return PersonModel.fromJson(data!);
  }

  Future<PersonModel> setPerson({
    required String id,
    required Map<String, dynamic> data,
  }) async {
    await personsRef.doc(id).set(data, SetOptions(merge: true));
    return await getPerson(id);
  }

  Future<String> uploadFileToStorageAndReturnUrl(File image) async {
    TaskSnapshot uploadTask = await storageRef.child("persons").putFile(image);
    return await uploadTask.ref.getDownloadURL();
  }
}
