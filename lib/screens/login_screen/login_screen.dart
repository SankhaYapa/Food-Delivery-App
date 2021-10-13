import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_button.dart';
import 'package:food_delivery_app/components/custom_dialogBox.dart';
import 'package:food_delivery_app/components/custom_header.dart';
import 'package:food_delivery_app/components/custome_textfield.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/screens/login_screen/forgotpassword.dart';
import 'package:food_delivery_app/screens/login_screen/register_screen.dart';
import 'package:food_delivery_app/utils/constant.dart';
import 'package:food_delivery_app/utils/util_function.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _isObscure = true;
  final _email = TextEditingController();
  final _password = TextEditingController();
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
                header: 'Login',
                tagline: 'Access Acount',
                image: 'header.png',
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2,
                              primary: Colors.white,
                              padding: EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {},
                          child:
                              Image.asset(Constants.imageAssets('google.png'))),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2,
                              primary: Colors.white,
                              padding: EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {},
                          child: Image.asset(
                              Constants.imageAssets('facebook.png')))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'or Login with Email',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                    borderSide:
                                        BorderSide(color: Colors.white)),
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

                                    AuthController().loginUser(
                                      context,
                                      _email.text,
                                      _password.text,
                                    );
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
                                text: 'Sign In'),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Center(
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                    text: 'Register',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        UtilFunction.navigateTo(
                                            context, RegisterPage());
                                      }),
                              ])),
                            ),
                            GestureDetector(
                                onTap: () {
                                  UtilFunction.navigateTo(
                                      context, ForgotPassword());
                                },
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

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
}
