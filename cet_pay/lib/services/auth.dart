import 'package:firebase_auth/firebase_auth.dart';
import 'package:cet_pay/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  // create user obj based on firebase user
  UserProfile _userFromFirebaseUser(User user) {
    return user != null ? UserProfile(uid: user.uid) : null;
  }

  // On Auth Changed Stream
    Stream <UserProfile> get user {
      return _auth.authStateChanges().map(_userFromFirebaseUser);
    }




  //sign in anonymously
  Future signInAnon() async  {
      try {
        UserCredential credential = await _auth.signInAnonymously();
        User user = credential.user;
        return user;
      }
      catch(e)
      {
          print(e.toString());
          return null;
      }
  }

  //sign in with email and password


  //register an account


  //sign out
Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch(e) {
      print(e.toString());
      return null;
    }
}


}