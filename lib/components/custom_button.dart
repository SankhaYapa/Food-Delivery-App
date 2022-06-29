import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_loader.dart';
import 'package:food_delivery_app/utils/app_colors.dart';


class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.height = 60,
      this.width = double.infinity,
      this.isLoading = false})
      : super(key: key);
  final Function() onTap;
  final String text;
  final double height;
  final double width;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: isLoading ? primaryColor.withOpacity(.3) : primaryColor,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: isLoading
              ? Custom_loader()
              : Text(
                  text,
                  // style: GoogleFonts.poppins(
                  //     fontSize: 18,
                  //     color: Colors.black,
                  //     fontWeight: FontWeight.w600),
                ),
        ),
      ),
    );
  }
}
