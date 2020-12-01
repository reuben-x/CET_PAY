import 'package:cet_pay/shared/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cet_pay/models/user.dart';

class AuthService {

  String admission;
  String name;
  String yearOfJoin;
  String roll;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  UserProfile _userFromFirebaseUser(User user) {
    return user != null ? UserProfile(uid: user.uid) : null;
  }

  // On Auth Changed Stream
  Stream<UserProfile> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }


  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password,String admission,String roll,String name,String yearOfJoin) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      //Create a new document for the user with uid
      await DatabaseService(uid: user.uid).updateUserData(admission,email,name,roll,yearOfJoin);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  void passInfo(String admissionNo,String roll, String name,String yearOfJoin)
  {
    this.admission = admissionNo;
    this.name = name;
    this.yearOfJoin= yearOfJoin;
    this.roll = roll;
  }
}
