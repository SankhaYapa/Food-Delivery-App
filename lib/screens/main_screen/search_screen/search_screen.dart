import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Container(
        child: Center(
          child: CustomText(
            text: 'Cart Screen',
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
