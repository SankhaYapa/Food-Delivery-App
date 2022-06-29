import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/auth/user_provider.dart';
import 'package:food_delivery_app/screens/splash_screen/getting_started.dart';
import 'package:food_delivery_app/utils/constant.dart';
import 'package:food_delivery_app/utils/util_function.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Provider.of<UserProvider>(context, listen: false).initializUser(context);
      UtilFunction.navigateTo(context, GettingStarted());
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Constants.imageAssets('food.png')),
          SizedBox(
            height: 8,
          ),
          Text(
            'No waiting for food',
            style: TextStyle(fontSize: 14, color: Color(0xFF838383)),
          )
        ],
      ),
    ));
  }
}
