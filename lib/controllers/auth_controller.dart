import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/components/custom_dialogBox.dart';
import 'package:food_delivery_app/controllers/db_controller.dart';
import 'package:food_delivery_app/screens/home_screen/home_screen.dart';
import 'package:food_delivery_app/utils/util_function.dart';

class AuthController {
  //Firebase Auth instance created
  FirebaseAuth auth = FirebaseAuth.instance;
//User registration created
  Future<void> registerUser(
    BuildContext context,
    String email,
    String password,
    String name,
    String phone,
  ) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user!.uid.isNotEmpty) {
        await DatabaseController().saveUserData(
          name,
          email,
          phone,
          userCredential.user!.uid,
        );
      }

      DialogBox().dialogBox(context, DialogType.SUCCES, 'User Account created',
          'Congratulations.Now you can LogIn');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DialogBox().dialogBox(
            context,
            DialogType.ERROR,
            'The password provided is too weak.',
            'Please Enter Valid Password');
      } else if (e.code == 'email-already-in-use') {
        DialogBox().dialogBox(
            context,
            DialogType.ERROR,
            'The account already exists for that email.',
            'Please Enter Valid Email');
      }
    } catch (e) {
      print(e);
    }
  }

  //user login function

  Future<void> loginUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        UtilFunction.navigateTo(context, HomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        DialogBox().dialogBox(
            context,
            DialogType.ERROR,
            'No user found for that email.',
            'Please Enter Please Enter correct Information');
      } else if (e.code == 'wrong-password') {
        DialogBox().dialogBox(
            context,
            DialogType.ERROR,
            'Wrong password provided for that user.',
            'Please Enter Please Enter correct Information');
      }
    }
  }

  //send password reset email function
  Future<void>? sendPasswordResetEmail(
    BuildContext context,
    String email,
  ) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        DialogBox().dialogBox(context, DialogType.ERROR, 'Invalid email.',
            'Please Enter valid email');
      } else {
        DialogBox().dialogBox(context, DialogType.ERROR, 'ERROR', e.toString());
      }
    } catch (e) {}
  }
}
