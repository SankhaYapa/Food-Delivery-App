import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/components/custom_dialogBox.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:logger/logger.dart';

class LogingProvider extends ChangeNotifier {
  //show hide password text
  bool _isObscure = true;
  //email controller
  final _email = TextEditingController();

  //password controller
  final _password = TextEditingController();

  //firebase auth controller
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //loading state
  bool _isLoading = false;

//get obscure
  bool get isObscure => _isObscure;

  //get loading state
  bool get isLoading => _isLoading;

  //get email controller
  TextEditingController get emailController => _email;

  //get password controller
  TextEditingController get passwordController => _password;

  //change obscure state
  void changeObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  //validator field
  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty || _password.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = true;
    } else {
      return true;
    }
    return isValid;
  }

  //login function
  Future<void> startLogin(BuildContext context) async {
    try {
      if (inputValidation()) {
        setLoading(true);

        AuthController().loginUser(
          context,
          _email.text,
          _password.text,
        );
        setLoading();
      } else {
        DialogBox().dialogBox(
            context,
            DialogType.ERROR,
            'Incorrect Information',
            'Please Enter Please Enter correct Information');
      }
    } catch (e) {
      setLoading();
      Logger().e(e);
    }
  }

  //change loading state
  void setLoading([bool val = false]) {
    _isLoading = val;
    notifyListeners();
  }
}
