import 'package:firebase_auth/firebase_auth.dart';
import 'package:infinity/database/database.dart';
import 'package:infinity/models/student.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get the uid of the current user logged in
  String get getCurrentUserID {
    return _auth.currentUser!.uid;
  }

  // create a person object based on FirebaseUser
  Person? _userFromFirebaseUser(User user) {
    return Person(id: user.uid);
  }

  // auth change user stream
  Stream<User?> get userSignInState => _auth.authStateChanges();

  
  // sign up with email and password
  Future signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    try {
      print('In Try block');
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;

      print(user);

      // create a new document for the user with the uid
      await FirestoreService(uid: user!.uid).setInitialUserData(
        id: user.uid,
        name: name,
        email: user.email,
        phoneNumber: phoneNumber,
      );

      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (error) {
      return error.code + '-null';
    }
  }

  // sign out
  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
