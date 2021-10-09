import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/login_screen/login_screen.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/utils/constant.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({Key? key}) : super(key: key);

  @override
  _GettingStartedState createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  CarouselController carouselController = CarouselController();
  List<Widget> list = [
    SliderItems(
      img: 'popcorn.png',
      text1: 'Choose A Tasty Dish',
      text2: 'Order anything you want from your\n Favorite restaurant.',
    ),
    SliderItems(
        img: 'money.png',
        text1: 'Easy Payment',
        text2:
            'Payment made easy through debit\n card, credit card  & more ways to pay\n for your food'),
    SliderItems(
        img: 'restaurant.png',
        text1: 'Enjoy the Taste!',
        text2:
            'Healthy eating means eating a variety\n of foods that give you the nutrients you\n  need to maintain your health.')
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: size.height / 2,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            carouselController: carouselController,
            items: list.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    child: Column(
                      children: [i],
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == entry.key ? primaryColor : grayColor),
                ),
              );
            }).toList(),
          ),
          BottomSection(
            size: size,
            ontap: () => carouselController.nextPage(),
          ),
        ],
      ),
    ));
  }
}

class SliderItems extends StatelessWidget {
  const SliderItems(
      {Key? key, required this.img, required this.text1, required this.text2})
      : super(key: key);
  final String img;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Constants.imageAssets(img),
        ),
        SizedBox(
          height: 37,
        ),
        Text(
          text1,
          style: TextStyle(fontSize: 22),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text2,
          style: TextStyle(
            fontSize: 14,
            color: grayColor,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
    required this.size,
    required this.ontap,
  }) : super(key: key);

  final Size size;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Image.asset(
          Constants.imageAssets('bottom.png'),
          width: size.width,
          fit: BoxFit.fitWidth,
        ),
        Positioned(
          bottom: 39,
          right: 43,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: ontap,
                child: Text(
                  'Next',
                  style: TextStyle(color: kblack, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                    primary: kwhite,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: kblack, fontSize: 16),
                  ))
            ],
          ),
        )
      ]),
    );
  }
}
