import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseController {
//Firestore instance create
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //create a collection reffernce
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  //save user information
  Future<void> saveUserData(
    String name,
    String phone,
    String email,
  ) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'name': name, // John Doe
          'email': email, // Stokes and Sons
          'phone': phone,
          // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
