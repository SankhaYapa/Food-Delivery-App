import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';


class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 15,
    this.color = kblack,
    this.fontWeight,
    this.textAlign,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      // style: GoogleFonts.poppins(
      //     fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
}
