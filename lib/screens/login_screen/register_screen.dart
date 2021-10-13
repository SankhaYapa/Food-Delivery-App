import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_button.dart';
import 'package:food_delivery_app/components/custom_dialogBox.dart';
import 'package:food_delivery_app/components/custom_header.dart';
import 'package:food_delivery_app/components/custome_textfield.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var _isObscure = true;
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _phone = TextEditingController();
  final _name = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: FadeInRight(
      child: Container(
        height: size.height,
        color: Color(0xFFE5E5E5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomHeader(
                size: size,
                header: 'Register',
                tagline: 'Create Acount',
                image: 'header.png',
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      CustomTextField(
                        controller: _name,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Email',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      CustomTextField(
                        controller: _email,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Phone Number',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      CustomTextField(
                        controller: _phone,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Password',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextField(
                          controller: _password,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              onTap: () async {
                                if (inputValidation()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await AuthController().registerUser(
                                      context,
                                      _email.text,
                                      _password.text,
                                      _name.text,
                                      _phone.text);
                                  setState(() {
                                    isLoading = false;
                                  });
                                } else {
                                  DialogBox().dialogBox(
                                      context,
                                      DialogType.ERROR,
                                      'Incorrect Information',
                                      'Please Enter Please Enter correct Information');
                                }
                              },
                              text: 'Sign Up'),
                    ],
                  ))
            ],
          ),
        ),
      ),
    ));
  }

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
}
