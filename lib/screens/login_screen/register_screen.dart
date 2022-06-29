import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_button.dart';
import 'package:food_delivery_app/components/custom_header.dart';
import 'package:food_delivery_app/components/custome_textfield.dart';
import 'package:food_delivery_app/providers/auth/restration_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              Consumer<RegistrationProvider>(builder: (context, value, child) {
                return Padding(
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
                          controller: value.nameController,
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
                          controller: value.emailController,
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
                          controller: value.phoneController,
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
                            controller: value.passwordController,
                            obscureText: value.isObscure,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    value.changeObscure();
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
                                    borderSide: BorderSide(color: Colors.red))),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                            onTap: () async {
                              value.startRegister(context);
                            },
                            isLoading: value.isLoading,
                            text: 'Sign Up'),
                      ],
                    ));
              })
            ],
          ),
        ),
      ),
    ));
  }
}
