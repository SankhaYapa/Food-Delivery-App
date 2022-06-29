import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_images.dart';
import 'package:food_delivery_app/components/custom_text.dart';
import 'package:food_delivery_app/screens/main_screen/cart_screen/cart_screen.dart';
import 'package:food_delivery_app/screens/main_screen/home_screen/home_screen.dart';
import 'package:food_delivery_app/screens/main_screen/profile_screen/profile_screen.dart';
import 'package:food_delivery_app/screens/main_screen/search_screen/search_screen.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:logger/logger.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  Future<bool> initBackButton() async {
    Logger().d('back button press');

    //when in home screen if you try to exit it shows dialog box
    return await showDialog(
          context: context,
          builder: (context) => ElasticIn(
            child: AlertDialog(
              title: CustomText(text: 'Exit App'),
              content: CustomText(text: 'Do you want to really exit an App'),
              actions: [
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: CustomText(text: 'No')),
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: CustomText(text: 'Yes'))
              ],
            ),
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: initBackButton,
      child: Scaffold(
        body: _screens.elementAt(_currentIndex),
        bottomNavigationBar: Container(
          height: 90,
          color: kwhite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavTile(
                icon: 'home',
                isSelected: _currentIndex == 0,
                ontap: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              BottomNavTile(
                icon: 'search',
                isSelected: _currentIndex == 1,
                ontap: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
              ),
              BottomNavTile(
                icon: 'cart',
                isSelected: _currentIndex == 2,
                ontap: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
              ),
              BottomNavTile(
                icon: 'profile',
                isSelected: _currentIndex == 3,
                ontap: () {
                  setState(() {
                    _currentIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavTile extends StatelessWidget {
  const BottomNavTile({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.ontap,
  }) : super(key: key);
  final String icon;
  final bool isSelected;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: isSelected ? primaryColor : kwhite,
            borderRadius: BorderRadius.circular(15)),
        child: CustomSvg(
          svgName: icon,
          color: isSelected ? kwhite : grayColor,
        ),
      ),
    );
  }
}
