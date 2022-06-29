import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_button.dart';
import 'package:food_delivery_app/components/custom_text.dart';
import 'package:food_delivery_app/providers/auth/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Container(
        child: Center(
          child: Column(
            children: [
              CustomText(
                text: 'Profile Screen',
                fontSize: 25,
              ),
              Consumer<UserProvider>(
                builder: (context, value, child) {
                  return Column(
                    children: [
                      CustomText(
                        text: value.userModel.email,
                        fontSize: 25,
                      ),
                    ],
                  );
                },
              ),
              CustomButton(
                  onTap: () {
                    Provider.of<UserProvider>(context, listen: false)
                        .logout(context);
                  },
                  text: 'Logout')
            ],
          ),
        ),
      ),
    );
  }
}
