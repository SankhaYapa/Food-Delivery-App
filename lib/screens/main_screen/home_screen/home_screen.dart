import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery_app/components/custom_header.dart';

import 'package:food_delivery_app/components/custom_title.dart';
import 'package:food_delivery_app/components/custome_textfield.dart';
import 'package:food_delivery_app/screens/main_screen/home_screen/widgets/category_section.dart';
import 'package:food_delivery_app/screens/main_screen/home_screen/widgets/choose_location_section.dart';
import 'package:food_delivery_app/screens/main_screen/home_screen/widgets/nearest_resturents.dart';
import 'package:food_delivery_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FadeInLeft(
      child: Scaffold(
        backgroundColor: mainBG,
        body: Column(
          children: [
            UpperSection(size: size, search: _search),
            BottomSection(),
          ],
        ),
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 34),
            CategorySection(),
            SizedBox(height: 20),
            CustomTitle(text: 'Nearest Resturents'),
            SizedBox(height: 11),
            NearestResturentSection(),
            SizedBox(height: 26),
            CustomTitle(text: 'Popular Resturant'),
            SizedBox(height: 11),
            NearestResturentSection(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class UpperSection extends StatelessWidget {
  const UpperSection({
    Key? key,
    required this.size,
    required TextEditingController search,
  })  : _search = search,
        super(key: key);

  final Size size;
  final TextEditingController _search;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeader(
            size: size,
            image: 'header.png',
            widget: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 66),
              child: CustomTextField(
                controller: _search,
                preffix: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: 'Find You Food',
              ),
            )),
        ChooseLocationSection()
      ],
    );
  }
}
