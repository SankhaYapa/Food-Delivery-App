import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_button.dart';
import 'package:food_delivery_app/components/custom_dialogBox.dart';
import 'package:food_delivery_app/components/custom_header.dart';
import 'package:food_delivery_app/components/custome_textfield.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _email = TextEditingController();
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
                header: 'Forgot Password',
                tagline: 'Reset your password',
                image: 'header.png',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      // style: GoogleFonts.poppins(
                      //     fontSize: 16,
                      //     color: Colors.black,
                      //     fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    CustomTextField(
                      controller: _email,
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
                                await AuthController().sendPasswordResetEmail(
                                    context, _email.text);
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
                            text: 'Send Password reset email'),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = true;
    } else {
      return true;
    }
    return isValid;
  }
}
