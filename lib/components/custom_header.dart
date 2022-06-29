import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/constant.dart';


class CustomHeader extends StatelessWidget {
  const CustomHeader({
    Key? key,
    required this.size,
    this.header,
    required this.image,
    this.tagline,
    this.widget,
  }) : super(key: key);

  final Size size;
  final String? header;
  final String image;
  final String? tagline;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Constants.imageAssets(image),
          width: size.width,
          fit: BoxFit.fitWidth,
        ),
        widget == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      header!,
                      // style: GoogleFonts.poppins(
                      //     fontSize: 22,
                      //     color: Colors.black,
                      //     fontWeight: FontWeight.w600),
                    ),
                    Text(
                      tagline!,
                      // style: GoogleFonts.poppins(
                      //     fontSize: 16,
                      //     color: Colors.black,
                      //     fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            : widget!
      ],
    );
  }
}
