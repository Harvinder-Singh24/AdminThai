import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class DatabaseService {
  late final String? uid;
  DatabaseService({required this.uid});

  //refrence collection
  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('adminData');

  //saving the user data_
  Future saveUserData(String startdate, String enddate, String duration, String description ,String hosted ,String date) async {
    return await usersCollection.doc(uid).set({
      "startdate": startdate,
      'enddate': enddate,
      "duration": duration,
      "date": date,
      "description": description,
      'hostedby': hosted,
    }).then((value) => print("Data is Saved"));
  }

}