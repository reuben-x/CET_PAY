import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(int admissionNo,String department,String mailId,String name,String roll,int yearOfJoin) async
  {
      return await userCollection.doc(uid).set({
        'admissionNo' :admissionNo,
        'department' : department,
        'mailId' : mailId,
        'name' : name,
        'roll' : roll,
        'yearOfJoin' : yearOfJoin,
      });
  }

  //get user stream
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }


}