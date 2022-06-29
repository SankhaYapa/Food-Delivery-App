import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_images.dart';
import 'package:food_delivery_app/utils/app_colors.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    Key? key,
    this.iconName = 'back_arrow',
    required this.onTap,
  }) : super(key: key);
  final String iconName;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 48,
          height: 48,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: kwhite, borderRadius: BorderRadius.circular(15)),
          child: CustomSvg(svgName: iconName)),
    );
  }
}
