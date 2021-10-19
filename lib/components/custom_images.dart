import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/utils/constant.dart';

class CustomSvg extends StatelessWidget {
  const CustomSvg({
    Key? key,
    required this.svgName,
  }) : super(key: key);
  final String svgName;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Constants.iconAssets('$svgName.svg'));
  }
}
