import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/components/custom_dialogBox.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:logger/logger.dart';

class RegistrationProvider extends ChangeNotifier {
  var _isObscure = true;
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _phone = TextEditingController();
  final _name = TextEditingController();

  bool _isLoading = false;

  //get email controller
  TextEditingController get emailController => _email;

  //get password controller
  TextEditingController get passwordController => _password;
  //get email controller
  TextEditingController get nameController => _name;

  //get password controller
  TextEditingController get phoneController => _phone;

  //get obscure
  bool get isObscure => _isObscure;

  //get loading state
  bool get isLoading => _isLoading;

  void changeObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }
  //validation function

  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty ||
        _name.text.isEmpty ||
        _phone.text.isEmpty ||
        _password.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else if (_phone.text.length != 10) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }

  Future<void> startRegister(BuildContext context) async {
    try {
      if (inputValidation()) {
        setLoading(true);
        await AuthController().registerUser(
            context, _name.text, _email.text, _phone.text, _password.text);
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
