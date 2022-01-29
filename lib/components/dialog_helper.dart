import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_button.dart';
import 'package:food_delivery_app/components/custom_images.dart';
import 'package:food_delivery_app/components/custom_text.dart';
import 'package:food_delivery_app/utils/app_colors.dart';

class DialogHelper extends StatelessWidget {
  const DialogHelper(
      {Key? key,
      required this.iconName,
      required this.buttonName,
      required this.text1,
      required this.btnOntap})
      : super(key: key);
  final String iconName;
  final String text1;
  final String buttonName;
  final Function() btnOntap;
  @override
  Widget build(BuildContext context) {
    return ElasticIn(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 279,
                width: 250,
                decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSvg(svgName: iconName),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: text1,
                      fontSize: 20,
                      color: Colors.green,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -20,
                child: CustomButton(
                  onTap: () {},
                  text: buttonName,
                  width: 172,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
