import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/components/custom_header.dart';
import 'package:food_delivery_app/components/custom_images.dart';
import 'package:food_delivery_app/components/custome_textfield.dart';
import 'package:food_delivery_app/screens/home_screen/widgets/choose_location_section.dart';
import 'package:food_delivery_app/utils/constant.dart';

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

    return Scaffold(
      body: Column(
        children: [
          UpperSection(size: size, search: _search),
          SizedBox(
            height: 34,
          ),
          Container(
            width: 65,
            height: 65,
          )
        ],
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
