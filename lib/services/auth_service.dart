import 'package:firebase_auth/firebase_auth.dart';

import 'database_service.dart';


class AuthService {
  final _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  bool isLoading = false;
  String startDate;
  String endDate;
  String duration;
  String description;
  String host;
  String date;

  AuthService({
    required this.startDate,
    required this.endDate,
    required this.duration,
    required this.description,
    required this.host,
    required this.date,
});


  //sign up user
  Future signUp(
      {required String email,
        required String password,
        }) async {
    try {
      User? user = (await _auth.createUserWithEmailAndPassword(
          email: email, password: password))
          .user;

      if (user != null) {
        DatabaseService(uid: user.uid).saveUserData(startDate,endDate,duration,description,host,date);
        print("Reached Service");
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //sign in user
  Future signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //sign out
  Future signOut() async {
    await _auth.signOut();
  }
}
