import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // user uid
  final String uid;

  FirestoreService({required this.uid});

  // collection references

  static final CollectionReference ticketsCollection =
      FirebaseFirestore.instance.collection('tickets');

  static final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

// -------------------- Setting stuff -------------------------
// data for a new user
  Future setInitialUserData({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
  }) async {
    return await usersCollection.doc(uid).set({
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    });
  }
}
