import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String admissionNo, String mailId, String name,
      String roll, String yearOfJoin) async {
    return await userCollection.doc(uid).set({
      'admissionNo': admissionNo,
      'mailId': mailId,
      'name': name,
      'roll': roll,
      'yearOfJoin': yearOfJoin,
    });
  }

  getUserData(String mailId) async {
    return await FirebaseFirestore.instance.collection('users').where("mailId",isEqualTo: mailId).get();
  }

  //get user stream
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
