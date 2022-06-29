import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_button.dart';
import 'package:food_delivery_app/components/custom_dialogBox.dart';
import 'package:food_delivery_app/components/custom_header.dart';
import 'package:food_delivery_app/components/custom_loader.dart';
import 'package:food_delivery_app/components/custom_text.dart';
import 'package:food_delivery_app/components/custome_textfield.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/providers/auth/login_provider.dart';
import 'package:food_delivery_app/screens/login_screen/forgotpassword.dart';
import 'package:food_delivery_app/screens/login_screen/register_screen.dart';
import 'package:food_delivery_app/utils/constant.dart';
import 'package:food_delivery_app/utils/util_function.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<bool> initBackButton() async {
    Logger().d('back button press');
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: initBackButton,
      child: Scaffold(
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
                            child: Image.asset(
                                Constants.imageAssets('google.png'))),
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
                    Consumer<LogingProvider>(builder: (context, value, child) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Email',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            CustomTextField(
                              controller: value.emailController,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            CustomText(
                              text: 'Password',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: TextField(
                                controller: value.passwordController,
                                obscureText: value.isObscure,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          value.changeObscure();
                                        });
                                      },
                                      icon: Icon(value.isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.red))),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                                isLoading: value.isLoading,
                                onTap: () async {
                                  value.startLogin(context);
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
                      );
                    })
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
