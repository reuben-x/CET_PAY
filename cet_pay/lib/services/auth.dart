import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cet_pay/screens/signin.dart';

String profileName;
String profilepicURL;
class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

 Observable<User> user;  //firebase user
 Observable<Map<String, dynamic>> profile; //custom user data in firestore
 PublishSubject loading = PublishSubject();

  Future<String> googleSignIn() async {
   final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
   final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

   final AuthCredential credential = GoogleAuthProvider.credential(
     accessToken: googleSignInAuthentication.accessToken,
     idToken: googleSignInAuthentication.idToken,
   );

   final UserCredential authResult = await _auth.signInWithCredential(credential);
   final User user = authResult.user;

   if (user != null) {
     assert(!user.isAnonymous);
     assert(await user.getIdToken() != null);

     final User currentUser = _auth.currentUser;
     assert(user.uid == currentUser.uid);

     print('signInWithGoogle succeeded: $user');
     profileName = user.displayName;
     profilepicURL = user.photoURL;
     return '$user';

   }

   return null;
  }

  Future updateUserData (User user) async {
   DocumentReference ref = _db.collection('users').doc(user.uid);

   return ref.set({
     'uid' : user.uid,
     'email' : user.email,
     'photoURL' : user.photoURL,
     'displayName' : user.displayName,
   },);
  }

  void signOut() {
   _auth.signOut();
  }


}
final AuthService authService = new AuthService();
